# arch-brain

Claude Code skill，充当资深软件架构师，用于架构评审、重构分析和架构方案设计。

## 项目结构

- `docs/superpowers/specs/` — 设计规格文档
- `docs/superpowers/plans/` — 实施计划文档
- Skill 安装目录: `~/.claude/skills/arch-brain/`

## Skill 文件

- `SKILL.md` — 主文件（流程定义、评估维度、控制逻辑），含 YAML frontmatter（`name` + `description`）
- `report-template.md` — 报告输出模板，被 SKILL.md Phase 4 引用

## 安装

```bash
mkdir -p ~/.claude/skills/arch-brain
cp SKILL.md report-template.md ~/.claude/skills/arch-brain/
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
