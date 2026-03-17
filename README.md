# arch-brain

[中文版](README.zh-CN.md)

A Claude Code skill that acts as a senior software architect — performing architecture review, refactoring analysis, and design evaluation with structured, multi-dimensional assessment reports.

## Features

- **Architecture Review** — Evaluate existing system architecture with quantified scoring
- **Refactoring Analysis** — Diagnose pain points and propose improvement paths
- **Design Evaluation** — Compare architecture options with trade-off analysis
- **Structured Reports** — Generate multi-dimensional assessment reports with actionable recommendations

## How It Works

The skill guides you through a four-phase interactive process:

```
Phase 1: Explore & Understand → Phase 2: Architecture Dialogue → Phase 3: Assessment → Phase 4: Report
```

1. **Explore & Understand** — Analyze codebase structure, dependencies, tech stack, or gather context through dialogue
2. **Architecture Dialogue** — Understand goals, constraints, and pain points through conversational Q&A
3. **Assessment** — Evaluate selected dimensions with evidence-based scoring (core: 1-10, auxiliary: High/Medium/Low)
4. **Report** — Generate structured evaluation document saved to `docs/arch-brain/reports/`

## Installation

```bash
mkdir -p ~/.claude/skills/arch-brain
cp SKILL.md report-template.md ~/.claude/skills/arch-brain/
```

## Usage

Invoke via `/arch-brain` in Claude Code:

```bash
# Analyze a codebase
/arch-brain ./src

# Analyze architecture documentation
/arch-brain docs/architecture.md

# Analyze with stated intent
/arch-brain ./src "want to split into microservices"

# Dialogue-guided mode (no arguments)
/arch-brain
```

## Evaluation Dimensions

### Core Dimensions (1-10 Score)

| Dimension | Focus |
|-----------|-------|
| Performance | Response time, throughput, resource utilization, bottleneck analysis |
| Security | Attack surface, authentication, data protection, compliance |
| Scalability | Horizontal/vertical scaling, elasticity, stateless design |
| Maintainability | Code readability, module coupling, change cost |
| Cost | Dev effort, migration cost, learning curve, infrastructure |
| ROI | Business value, tech debt reduction, efficiency gains |

### Auxiliary Dimensions (High/Medium/Low Risk)

Testability, Observability, Team Cognitive Load, Tech Debt, Migration Risk, Data Consistency, Availability/DR, Deployment Complexity

> Dimensions are dynamically selected based on project characteristics and confirmed with user.

## Report Output

Reports are saved to `docs/arch-brain/reports/YYYY-MM-DD-<topic>.md` and include:

- Executive summary
- Current state analysis
- Core dimension scoring with detailed analysis
- Auxiliary dimension risk ratings
- Architecture proposals (at least 2 options)
- Implementation roadmap (short/medium/long term)
- Decision recommendations and action items

## Project Structure

```
arch-brain/
├── CLAUDE.md                          # Project context and workflow constraints
├── README.md                          # English documentation
├── README.zh-CN.md                    # Chinese documentation
└── docs/
    └── superpowers/
        ├── specs/                     # Design specification
        └── plans/                     # Implementation plan
```

## License

MIT
