#!/usr/bin/env bash
# Book integrity check: render the Quarto book and run static checks.
# Usage: conda activate ai-safety-security && scripts/check.sh
set -uo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BOOK="$ROOT/book"
SITE="$BOOK/_site"
LOG="$(mktemp)"
fail=0

echo "==> quarto render"
if ! quarto render "$BOOK" --to html >"$LOG" 2>&1; then
  echo "   render FAILED"; tail -30 "$LOG"; exit 1
fi

echo "==> render warnings/errors"
if grep -iE "WARN|ERROR" "$LOG" | grep -viE "tinytex|no TeX installation"; then
  echo "   ^ warnings present"; fail=1
fi

echo "==> unresolved citations"
if grep -rEoh "\[@[A-Za-z0-9_:-]+\]" "$SITE" --include=*.html 2>/dev/null | sort -u | grep .; then
  echo "   ^ unresolved citations"; fail=1
fi

echo "==> unresolved cross-references"
if grep -rEoh "\?@[A-Za-z0-9_:-]+" "$SITE" --include=*.html 2>/dev/null | sort -u | grep .; then
  echo "   ^ unresolved cross-references"; fail=1
fi

echo "==> stylesheet bundled"
[ -f "$SITE/assets/styles.css" ] || { echo "   ^ styles.css not bundled"; fail=1; }

echo "==> executable code cells (no errors)"
if grep -rlE "cell-output-error|Traceback \(most recent call last\)" "$SITE" --include=*.html 2>/dev/null | grep .; then
  echo "   ^ code cell errors"; fail=1
fi

rm -f "$LOG"
if [ "$fail" -eq 0 ]; then echo "ALL CHECKS PASSED"; else echo "CHECKS FAILED"; exit 1; fi
