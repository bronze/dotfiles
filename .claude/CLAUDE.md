# Global Claude Instructions

## Available CLI Tools

- `markitdown` — converts files (PDF, DOCX, PPTX, HTML, images, etc.) to Markdown. Installed via pipx.
  - Usage: `markitdown <file>` or `markitdown <url>`
  - When the user asks to read/extract content from a non-text file, prefer `markitdown` over other approaches.
