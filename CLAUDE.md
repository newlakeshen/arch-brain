# arch-brain

适用于 Claude Code 和 Codex CLI 的 skill，充当资深软件架构师（观点鲜明的顾问风格），用于架构评审、重构分析和架构方案设计。支持项目架构了解、证据化评分、风险情景推演和 ADR 生成。

## 项目结构

- `install_to_claude.sh` — Claude Code 安装/卸载脚本
- `install_to_codex.sh` — Codex CLI 安装/卸载脚本
- `SKILL.md` — Skill 主文件（项目 repo 副本，安装时复制到 skill 目录）
- `report-template.md` — 报告模板（项目 repo 副本）
- `README.md` — 英文文档
- `README.zh-CN.md` — 中文文档
- Skill 安装目录: `~/.claude/skills/arch-brain/`（Claude Code）或 `~/.codex/skills/arch-brain/`（Codex CLI）

## Skill 文件

- `SKILL.md` — 主文件（1200-1500 词），含 YAML frontmatter，包含：项目架构了解、架构模式库、证据化评分体系（6 维度具体标准）、判定标签（✅/⚠️/🚨）、风险情景分析、顾问风格定义、Mermaid 可视化指令、ADR 生成指令、上下文驱动维度推荐映射
- `report-template.md` — 报告模板，含：项目画像(S0)、架构师核心观点(S1)、Mermaid 图(S2/S6)、风险情景分析(S5)、ADR 附录，被 SKILL.md Phase 4 引用

## 安装

```bash
git clone <repo-url>
cd arch-brain
./install_to_claude.sh          # 安装到 Claude Code
./install_to_codex.sh           # 安装到 Codex CLI
```

## 使用方式

在 Claude Code 中通过 `/arch-brain` 调用，支持可选参数：
- `/arch-brain ./src` — 分析代码库
- `/arch-brain docs/architecture.md` — 分析架构文档
- `/arch-brain` — 对话引导模式

## 语言

规格文档和报告使用中文。Skill 接口文件（SKILL.md）使用英文。

## 工作流约束

- **对话语言**：与用户之间的所有对话使用中文
- **提交前更新 CLAUDE.md**：每次提交代码前，结合当前 session 的信息准确更新 CLAUDE.md
- **提交前代码审查**：每次提交代码前，使用 `requesting-code-review` skill 审查本次提交的代码，发现问题立即修复后再提交。审查时忽略测试类文件和文档文件
