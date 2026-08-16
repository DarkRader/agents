---
name: proofreader
description: Mechanically corrects spelling, grammar, articles, prepositions, punctuation, and capitalization in user-provided text while preserving the original tone, voice, and sentence structure. Use whenever the user pastes or uploads text and asks to fix, correct, check, clean up, or proofread it — even if they don't use the word "proofread" explicitly (e.g. "fix this paragraph", "check my email for mistakes", "can you clean this up"). Does NOT rewrite, paraphrase, or improve prose style — only mechanical correctness. If the user wants style improvements, better word choice, or restructuring, that is a different task — clarify with them first.
---

# Proofreader

A precision proofreading tool. It corrects mechanical errors in text without
touching the author's voice.

## Scope

Fix ONLY:
- Spelling errors
- Grammar errors (verb tense, agreement, pluralization, word form, etc.)
- Article usage (a / an / the, including missing or extra articles)
- Preposition usage (to / in / on / at / etc.)
- Punctuation errors (missing/incorrect commas, periods, apostrophes, quotation marks)
- Capitalization errors (sentence starts, proper nouns, titles)

Do NOT:
- Paraphrase or reword for style, flow, or "better" prose
- Change sentence structure or word order unless required to fix a grammar error
- Change the register or tone (informal stays informal, academic stays academic, casual typos like "u" for "you" in a text message stay as a stylistic choice, not an error — see Edge Cases below)
- Flag or rewrite sentences that are grammatically correct but merely awkward, wordy, or unclear
- Add commentary, opinions, or suggestions unless the user has asked for a changelog

## Process

1. **Detect the language(s) present.** Apply that language's own grammar, spelling, and orthographic conventions. If multiple languages are mixed intentionally (e.g. code-switching, quoted foreign phrases, brand names), leave the non-primary-language portions alone unless they themselves contain clear errors.
2. **Read the whole text first** before editing, to establish the author's tone and register (formal/informal/academic/casual) so corrections don't accidentally shift it.
3. **Correct only what's in scope** (see above), making the minimal edit needed to fix each error. Prefer the smallest possible change over a "nicer-sounding" alternative.
4. **Preserve everything else exactly**: line breaks, paragraph breaks, formatting (bold/italics/lists), emoji, intentional stylistic choices, quoted material, and any deliberate informality.

## Output format

**Default behavior:** Output only the corrected text. No preamble, no explanation, no "Here is your corrected text:", no closing remarks.

**If the text has no errors:** Return it completely unchanged. Do not add a note saying so.

**If the user asks for a changelog / what changed / an explanation:** First give the full corrected text, then below it provide a short list of changes, each as `original → corrected — brief reason`. Keep reasons terse (a few words). This is also where awkward-but-correct sentences may be mentioned, never inline in the corrected text itself.

## Edge cases

- **Intentional non-standard usage** (dialect, slang, stylized brand voice, deliberate fragments for effect, text-speak in an informal message): leave alone — this is a style choice, not an error. Only correct it if it's clearly a typo or unintentional slip rather than a deliberate voice choice. When genuinely ambiguous, lean toward preserving rather than correcting.
- **Proper nouns, names, technical terms, code snippets:** never alter spelling or casing unless there's a typo, the user's own context confirms the correct form, and you have copyright headroom to take the smallest possible fix.
- **Quoted text within the document** (e.g. a quote attributed to someone): correct only obvious transcription typos; do not "fix" a quote's grammar if it appears to be an intentional direct quotation.
- **Ambiguous corrections** (more than one valid fix, e.g. missing word could be "a" or "the" depending on unstated context): choose the most contextually likely option silently; do not interrupt the user mid-task to ask, since this tool is meant to be fast and frictionless. If genuinely unresolvable, leave it unchanged rather than guessing badly.
- **Very long documents:** process the entire text in one pass; do not truncate or summarize.
