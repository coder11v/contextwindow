# Contributing to LLM Context Window Benchmark

Thanks for taking the time to contribute! This project aims to track and compare LLM coding capabilities through interactive demonstrations.

## 📋 Guidelines

-   **Model Outputs**:
    -   Provide only the generated `index.html` file in the model subdirectory.
    -   Ensure the output is relatively self-contained. 
    -   If the model generated a single HTML file with CSS and JS included, that's preferred.
-   **Structure**: 
    -   Follow the directory structure: `benchmark/model/index.html`.
    -   Include the matching `prompt.txt` for any new benchmark.
-   **Model Identifiers**: Use lowercase names for folders (e.g., `gpt-4o`, `gemini-1.5-pro`).
-   **No Malicious Code**: Submissions must not contain any scripts tracking users or conducting malicious activity.

## 🔄 Pull Request Process

1.  **Fork** the repository and create your feature branch.
2.  Add your model result or benchmark.
3.  Run `bash create_config.sh` to update `config.json`.
4.  **Commit** your changes (including the updated `config.json`).
5.  **Test Locally**: Open `index.html` in your browser and verify your new entry appears correctly.
6.  **Submit a PR**: Provide a brief description of the model or benchmark you added.

## 🛠 Testing

We use a simple bash script to generate the site index. Before submitting, ensure:
```bash
bash create_config.sh
```
runs without errors and the resulting `config.json` is valid.

## 💬 Community

If you have questions or want to discuss a specific benchmark, feel free to open an Issue!
