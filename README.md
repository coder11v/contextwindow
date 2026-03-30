# LLM Context Window Benchmark

A visual benchmark comparing how different Large Language Models (LLMs) handle complex coding prompts, particularly for games and interactive UI. This project serves as a "context-window-in-action" gallery.

## 🚀 How it Works

The project is a static site that aggregates benchmark results from various models (Gemini, Claude, GPT, Grok). Each benchmark is a directory containing:
1. `prompt.txt`: The exact prompt given to the models.
2. Sub-directories for each model (e.g., `gemini`, `claude`) containing the generated `index.html`.
3. `modelnames.json`: Mapping internal IDs to human-readable names.

## 🏗 Directory Structure

```text
.
├── create_config.sh    # Script to regenerate the gallery index
├── index.html          # Main gallery UI
├── flappy/             # Benchmark: Flappy Bird clone
│   ├── prompt.txt      # The prompt used
│   ├── gemini/         # Result from Gemini
│   │   └── index.html
│   └── claude/         # Result from Claude
│       └── index.html
└── platformer/         # Benchmark: Platformer game
    └── ...
```

## 🛠 Features

- **Side-by-Side Comparison**: view model outputs for the same prompt in one interface.
- **Dynamic Config Generation**: Just drop a new result folder and run `create_config.sh`.
- **Vanilla Implementation**: No heavy frameworks, just fast, static HTML/JS.

## 🤝 How to Contribute

We welcome contributions of new benchmarks or new model results for existing benchmarks!

### 1. Adding a New Model Result
If you want to add a result for a model (e.g., "DeepSeek") to an existing benchmark (e.g., `flappy`):

1. Create a folder named `deepseek` inside `flappy/`.
2. Add the generated `index.html` file into `flappy/deepseek/`.
3. (Optional) Add the model name to `flappy/modelnames.json`.
4. Run `./create_config.sh` to update the site.

### 2. Adding a New Benchmark
1. Create a new root folder (e.g., `tetris/`).
2. Add a `prompt.txt` with the prompt you used.
3. Add folders for each model you tested.
4. Run `./create_config.sh`.

## 💻 Local Development

1. Clone the repository.
2. To view the site, you can use any static server, like `npx phost` or `python -m http.server`.
3. After adding new folders or files, run:
   ```bash
   bash create_config.sh
   ```

## 📜 License

See [LICENSE.md](LICENSE.md) for details.
