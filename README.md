# arch-brain

[中文版](README.zh-CN.md)

A Claude Code skill that acts as an opinionated senior software architect — performing architecture review, refactoring analysis, and design evaluation with evidence-based scoring, risk scenario analysis, and structured reports.

## Features

- **Project Fingerprint Engine** — Auto-detect tech stack, architecture style, scale, and team traits from codebase
- **Architecture Pattern Library** — Identify patterns (layered, microservices, hexagonal, CQRS, event-driven, etc.) and detect anti-patterns
- **Evidence-Based Scoring** — Quantified evaluation with concrete criteria per dimension and judgment labels (✅/⚠️/🚨)
- **Risk Scenario Analysis** — What-if analysis (10x traffic, service failure, tech debt accumulation, team turnover)
- **Opinionated Advisor Style** — Says "must" and "should not" with specific reasoning
- **Architecture Visualization** — Mermaid diagrams (≤15 nodes) for module relationships, deployment, and process flows
- **ADR Generation** — Architecture Decision Records in report appendix

## How It Works

Four-phase interactive process with user confirmation at each stage:

```
Phase 1: Explore & Understand → Phase 2: Architecture Dialogue → Phase 3: Assessment → Phase 4: Report
```

1. **Explore & Understand** — Project fingerprint analysis (reads CLAUDE.md/README.md first, then scans technical metadata) or dialogue-guided context gathering
2. **Architecture Dialogue** — Goals, constraints, pain points; anti-pattern detection; context-driven dimension recommendation
3. **Assessment** — Evidence-based scoring with concrete criteria, judgment labels, risk scenario analysis, opinionated advisor style
4. **Report** — Structured document with project profile, core opinions, Mermaid diagrams, risk scenarios, and ADR appendix

## Installation

```bash
git clone https://github.com/lakeshen/arch-brain.git
cd arch-brain
./install.sh
```

To uninstall:

```bash
./install.sh uninstall
```

## Usage

Invoke via `/arch-brain` in Claude Code:

```bash
# Analyze a codebase (triggers fingerprint engine)
/arch-brain ./src

# Analyze architecture documentation
/arch-brain docs/architecture.md

# Analyze with stated intent
/arch-brain ./src "want to split into microservices"

# Dialogue-guided mode (no arguments, skips fingerprint engine)
/arch-brain
```

## Evaluation Dimensions

### Core Dimensions (1-10 Score with Judgment Labels)

| Dimension | Focus | Judgment |
|-----------|-------|---------|
| Performance | Response time (P99), throughput, resource utilization | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |
| Security | Attack surface, auth, data protection, compliance | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |
| Scalability | Horizontal/vertical scaling, elasticity, stateless | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |
| Maintainability | Module coupling, change cost, onboarding time | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |
| Cost | Dev effort, migration cost, infrastructure | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |
| ROI | Business value, tech debt reduction, efficiency | ✅ 7+ / ⚠️ 4-6 / 🚨 1-3 |

### Auxiliary Dimensions (High/Medium/Low Risk)

Testability, Observability, Team Cognitive Load, Tech Debt, Migration Risk, Data Consistency, Availability/DR, Deployment Complexity

> Dimensions are automatically recommended based on project traits (e.g., high traffic → Performance + Scalability + Security) and confirmed with user.

## Report Output

Reports are saved to `docs/arch-brain/reports/YYYY-MM-DD-<topic>.md` and include:

- **Project Profile** — Auto-generated from fingerprint engine
- **Architect Core Opinions** — 3-5 key findings with strong judgments
- **Current State Analysis** — With Mermaid architecture diagram
- **Core Dimension Scoring** — Evidence-based with judgment labels (✅/⚠️/🚨)
- **Auxiliary Dimension Ratings** — Risk-based assessment
- **Risk Scenario Analysis** — 2-3 What-If scenarios with mitigations
- **Architecture Proposals** — At least 2 options with optional comparison diagram
- **Implementation Roadmap** — Short/medium/long term with risk mitigation
- **ADR Appendix** — Architecture Decision Records from the review

## Project Structure

```
arch-brain/
├── install.sh                        # Install/uninstall script
├── SKILL.md                          # Skill main file (installed to ~/.claude/skills/)
├── report-template.md                # Report template (installed to ~/.claude/skills/)
├── CLAUDE.md                         # Project context and workflow constraints
├── README.md                         # English documentation
├── README.zh-CN.md                   # Chinese documentation
└── docs/
    └── superpowers/
        ├── specs/                    # Design specification (v2)
        └── plans/                    # Implementation plan
```

## License

MIT
