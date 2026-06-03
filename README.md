# Auto Release Action

[![GitHub Marketplace](https://img.shields.io/badge/Marketplace-Auto%20Release-blue?logo=github)](https://github.com/marketplace/actions/auto-release)
![Version](https://img.shields.io/github/v/release/Godners-Code/auto-release-action)
[![License](https://img.shields.io/github/license/Godners-Code/auto-release-action)](LICENSE)

**一个简单且强大的定时自动发布 Action**，每天（或指定时间）自动检测代码变更，创建 Git Tag 并发布 GitHub Release，适合需要**每日快照版本**的仓库。

---

### ✨ 特性

- **每日自动发布**（支持 cron 定时）
- 自动生成语义化 Tag（`vYYYY.MM.DD`）
- 自动创建 GitHub Release
- 支持输出 `has_changes` 和 `release_tag`
- 仅在有新提交时才创建 Release（避免空发布）
- 使用 Composite Action，轻量且易维护

---

### 📖 使用示例

#### 1. 基础用法（每日自动发布）

```yaml
name: Auto Daily Release

on:
  schedule:
    - cron: '0 0 * * *'     # 每天 UTC 00:00 执行
  workflow_dispatch:         # 支持手动触发

permissions:
  contents: write

jobs:
  release:
    runs-on: ubuntu-latest

    steps:
      - name: Auto Release
        uses: Godners-Code/auto-release-action@v1
        with:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
```
---

### 🎛️ 输入参数



| 参数           | 描述                              | 默认值          | 必填 |
|:--------------:|:---------------------------------:|:---------------:|:----:|
| `GITHUB_TOKEN` | GitHub Token（必须有 `contents: write` 权限） | （无）               | 是   |

**未来计划支持更多参数**（版本策略、Changelog、Pre-release 等）。

---

### 📤 输出参数

| 输出              | 描述                        |
|-------------------|-----------------------------|
| `has_changes`     | 本次是否有新提交（`true`/`false`） |
| `release_tag`     | 本次创建的 Tag 名称         |

---

### 🔧 进阶用法

#### 结合输出判断后续步骤

```yaml
- name: Auto Release
  id: autorelease
  uses: Godners-Code/auto-release-action@v1
  with:
    GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}

- name: Upload Assets (仅当有新版本时)
  if: steps.autorelease.outputs.has_changes == 'true'
  uses: softprops/action-gh-release@v2
  with:
    tag_name: ${{ steps.autorelease.outputs.release_tag }}
    files: ./dist/*
```

---

### 📋 推荐使用场景

- 内部工具 / CLI 工具每日构建版
- 文档、配置、模板仓库
- 需要给客户/团队提供最新稳定快照的场景
- 不想手动打 Tag 的轻量项目

---

### 📌 注意事项

- 需要仓库开启 **Read and write permissions**（Settings → Actions → General）
- 建议使用 `GITHUB_TOKEN`，无需额外创建 PAT
- 首次运行会基于当前最新 commit 创建 Release

---

### 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**Star 支持一下项目**，让我知道这个 Action 对你有帮助！

---
