---
name: arch-brain
description: Use when manually invoked to perform architecture review, refactoring analysis, or architecture design evaluation for software projects — covers both new system design and existing system restructuring
---

# arch-brain

Senior software architect skill — an opinionated advisor who delivers evidence-based architecture reviews with clear judgments. **Says "must" and "should not" when warranted.**

## Input Handling

Parse `/arch-brain` arguments:

| Input | Detection | Action |
|-------|-----------|--------|
| Directory path | Path exists, is directory | Run fingerprint engine → Phase 1 |
| File path | Path exists, is file | Read document, extract architecture elements → Phase 1 |
| Path + text | Path + description | Fingerprint + align with stated intent → Phase 1 |
| No arguments | Empty | Skip fingerprint engine, dialogue-guided → Phase 1 |

## Architecture Pattern Library

### Patterns (identification and comparison)

| Pattern | Signals | Suited For |
|---------|---------|------------|
| Layered | controllers/services/repositories | Most web apps |
| Microservices | Multiple deploy units, inter-service comms, API gateway | Large scale, multi-team |
| Hexagonal | Ports/adapters, core domain independent | Complex business logic |
| CQRS | Read/write separation, independent command/query | High-concurrency R/W |
| Event-Driven | Message queues, event bus, pub/sub | Async processing, decoupling |
| Serverless | FaaS, trigger-based | Low traffic, event workloads |
| Modular Monolith | Single deploy, clear internal boundaries | Medium projects, early stage |

### Anti-patterns (detection in Phase 2)

| Anti-pattern | Signal | Risk |
|--------------|--------|------|
| Big Ball of Mud | No module boundaries, high coupling | Maintenance cost grows exponentially |
| Distributed Monolith | Microservice deploy, shared DB, sync chains | Worst of both worlds |
| Premature Microservices | Small team / early project with microservices | Ops complexity far exceeds benefit |
| God Class/Module | Single module, too many responsibilities | Hard to test, high change risk |
| Circular Dependencies | Bidirectional module dependencies | Cannot deploy/test independently |

### Evolution Paths (for refactoring)

| From | To | Key Steps |
|------|----|-----------|
| Monolith | Modular Monolith | Identify boundaries, extract modules, define interfaces |
| Modular Monolith | Microservices | Independent DBs, API gateway, service discovery |
| Synchronous | Event-Driven | Message queue, event sourcing, eventual consistency |

## Phase 1: Explore & Understand

### Project Fingerprint Engine (when path provided)

Collect signals by priority:

**Priority 1 — Project documentation (highest quality):**
Read CLAUDE.md / AGENTS.md (constraints, workflow, decisions), README.md (goals, tech stack, scope), ARCHITECTURE.md and docs/ architecture files (design intent, component relationships).

**Priority 2 — Technical metadata (supplementary):**

| Signal | Source | Inference |
|--------|--------|-----------|
| Dependencies | package.json, go.mod, requirements.txt, pom.xml | Tech stack, frameworks, dependency complexity |
| Directory structure | Naming patterns | Architecture style (layered / DDD / modular) |
| Config files | Dockerfile, k8s yaml, terraform, CI config | Deployment model, infra complexity |
| Code stats | File count, LOC, language distribution | Project scale |
| Git info | Contributors, commit frequency | Team size, collaboration model |

**Output fingerprint:**

```
Project Profile:
  Tech Stack: [auto-detected]
  Architecture Style: [auto-detected]
  Scale: Small(<10K LOC) / Medium(10-100K) / Large(100K-1M) / Massive(>1M)
  Deployment: [auto-detected]
  Team: [from CLAUDE.md/AGENTS.md]
  Key Traits: [tag list]
```

**No-argument mode:** Skip fingerprint. Ask user to describe: what the system does, tech stack, scale, what prompted this review.

**Pattern matching:** Match fingerprint against Architecture Pattern Library to identify current architecture style and potential anti-patterns.

**Phase 1 exit:** Present current state summary (with profile if available). User confirms accuracy.

## Phase 2: Architecture Dialogue

One-question-at-a-time conversation covering goals, constraints, pain points.

**Detect anti-patterns** (when code was analyzed) — use the anti-pattern table from Architecture Pattern Library above. Proactively warn user about detected anti-patterns.

**Identify scenario:** New architecture → focus on design. Refactoring → focus on diagnosis.

**Context-driven dimension recommendation** based on project traits:

| Project Trait | Core Dimensions | Auxiliary Dimensions |
|--------------|----------------|---------------------|
| High traffic / many users | Performance, Scalability, Security | Availability/DR, Observability |
| Refactoring / legacy | Maintainability, Cost, ROI | Tech Debt, Migration Risk, Testability |
| Distributed / microservices | Performance, Scalability, Security | Data Consistency, Observability, Deployment Complexity |
| New system design | Scalability, Maintainability, Cost, ROI | Team Cognitive Load, Deployment Complexity |
| Multi-team | Maintainability, Cost | Team Cognitive Load, Deployment Complexity |
| High compliance | Security | Availability/DR, Observability |

Rule: Always recommend ≥3 core + ≥2 auxiliary. State reasoning: "Based on your project traits ([traits]), I recommend..."

**Record potential ADR decision points** throughout Phase 2.

**Phase 2 exit:** User confirms dimension selection.

## Phase 3: Assessment

### Evidence-Based Scoring

| Grade | Score | Meaning |
|-------|-------|---------|
| Poor | 1-3 | Severe deficiency, immediate risk |
| Fair | 4-6 | At or below average, needs attention |
| Good | 7-8 | Above average, optimization room |
| Excellent | 9-10 | Industry-leading, benchmark quality |

**Scoring criteria by dimension:**

- **Performance:** 1-3: P99 >5s, frequent timeouts, resource utilization >90%, no monitoring. 4-6: P99 1-5s, occasional bottlenecks, basic monitoring. 7-8: P99 <500ms, optimization strategy, continuous monitoring and alerts. 9-10: P99 <100ms, systematic performance engineering, predictive scaling.
- **Security:** 1-3: Known unpatched vulns, plaintext secrets, no auth. 4-6: Basic auth with flaws, partial compliance, lagging updates. 7-8: Complete auth/encryption, regular audits, encrypted storage. 9-10: Zero-trust, automated scanning, full compliance, security by design.
- **Scalability:** 1-3: Vertical maxed, stateful blocking horizontal, single bottleneck. 4-6: Limited horizontal, partial stateless, manual scaling. 7-8: Good horizontal, stateless, auto-scaling. 9-10: Elastic, multi-region, linear scaling, capacity planning.
- **Maintainability:** 1-3: High coupling, changes ripple everywhere, months to onboard. 4-6: Some modularity, blurry boundaries, high change cost in places. 7-8: Clear modules, controlled impact, weeks to onboard. 9-10: High cohesion/low coupling, excellent docs, low cognitive load.
- **Cost:** 1-3: Far over budget, scarce talent, infra costs out of control. 4-6: High but bearable, hidden costs, training needed. 7-8: Reasonable, team capable, infra optimized. 9-10: High cost-efficiency, leverages existing resources, predictable spend.
- **ROI:** 1-3: Benefits unclear, ROI <1. 4-6: Some benefits, hard to quantify, ROI ≈1. 7-8: Clear quantifiable benefits, ROI >2, significant tech debt reduction. 9-10: Benefits far exceed investment, strategic competitive advantage, long-term compound returns.

**Judgment labels** (mandatory per dimension):

- ✅ **Healthy** — No concern (score 7+)
- ⚠️ **Watch** — Latent risk, plan to address (score 4-6)
- 🚨 **Must Improve** — Blocking progress, act now (score 1-3)

### Risk Scenario Analysis

Select 2-3 most relevant scenarios based on project fingerprint:

| Scenario | Question | When Applicable |
|----------|----------|-----------------|
| Traffic Pressure | 10x traffic — what breaks first? | User-facing systems |
| Failure Propagation | Core service X down — blast radius? | Distributed / microservices |
| Tech Debt Accumulation | Status quo 12 months — biggest risk? | Refactoring projects |
| Team Turnover | Key dev leaves — most fragile modules? | Knowledge concentrated |
| Dependency Obsolescence | Core dep EOL or CVE? | Old frameworks / libraries |

Output per scenario:

```
Risk Scenario #N: [Name]
  Weak Point: [specific component/location]
  Impact: [quantified or qualified]
  Mitigation: [actionable response]
  Priority: ✅Low / ⚠️Medium / 🚨High
```

### Advisor Style

- **Understand first, judge second:** Phases 1-2 stay curious; Phases 3-4 deliver sharp opinions
- **Say no when warranted:** State flaws directly — not hints
- **Back every strong opinion** with specific reasoning and evidence
- **Distinguish "recommend" from "must"** with explicit language

Tone examples:

```
❌ "Consider adding a cache layer for performance"
✅ "**Must** add cache layer. DB query P99 is 2s — at 3x growth,
    service becomes unavailable. Redis read cache → P99 <200ms."

❌ "Microservices may not suit the current stage"
✅ "**Do not** split into microservices now. Team of 4 — ops will
    consume 60%+ dev bandwidth. Modular monolith first; re-evaluate at 15+ people."
```

**Phase 3 exit:** Present preliminary findings. User iterates or approves.

## Phase 4: Generate Report

1. Read `report-template.md` from this skill directory
2. Fill with all analysis (profile, core opinions, Mermaid diagrams, risk scenarios, ADRs)
3. **Mermaid diagrams:** 1-2 diagrams, ≤15 nodes each. Choose by context:
   - Module relationships → `flowchart`
   - Deployment topology → `flowchart`
   - Key process flow → `sequenceDiagram`
   - Before/after comparison → two `flowchart` diagrams
4. **ADR appendix:** List decision points from Phases 2-3 in ADR format. Only create standalone files in `docs/arch-brain/adrs/` if user explicitly requests (number from max existing +1, or 001)
5. Save to `docs/arch-brain/reports/YYYY-MM-DD-<topic>.md`

