# Decomp Agent Flow (STRICT)

Target: reduce livediff mismatch for ONE function by ONE edit per loop.

Loop:
1) Run: agent/agent_livediff.sh
2) Read agent/agent_livediff_ovl8_13_func_ovl8_8037D8CC.txt
3) Form a hypothesis based on one or a combonation (register lifetime, stack frame, call setup, delay slot, load form, extra temp).
4) Apply a local edit in the SINGLE C function only.
   Allowed edits:
   - introduce/remove a temp
   - move one statement
   - split/merge expression
   - add/remove explicit cast
   - reorder local declarations
   - add/remove no-op `if (ptr) {}` ONLY if it narrows diff
   - any valid edits to the function that preserves what the code does.
   Forbidden:
   - changing other functions
   - loading the asm using GLOBAL_ASM or otherwise
5) Re-run livediff.
6) If diff got worse by a lot or new mismatches appear: revert.

Output after each loop:
- hypothesis
- exact code change
- whether diff improved
