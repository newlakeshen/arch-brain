# Report Template

Use this template when generating the final architecture evaluation report in Phase 4.
Fill all `[placeholder]` sections with actual analysis content from Phases 1-3.

---

## Template

```markdown
# [项目名称] 架构评估报告

**日期:** YYYY-MM-DD
**评估类型:** 新架构设计 / 重构分析
**评估范围:** [简述]

---

## 0. 项目画像

> 仅当有代码库分析时包含此章节。无代码分析时删除此章节。

- **技术栈:** [语言、框架、中间件、基础设施]
- **架构风格:** [分层 / 微服务 / 六边形 / CQRS / 事件驱动 / Serverless / 模块化单体]
- **项目规模:** [小型(<10K LOC) / 中型(10-100K) / 大型(100K-1M) / 巨型(>1M)]
- **部署模式:** [单机 / 容器化 / K8s / Serverless / 混合]
- **团队特征:** [团队规模、协作模式、关键约束]
- **关键特征:** [标签列表，如：高并发、多租户、实时处理]

## 1. 架构师核心观点

> 3-5 条最重要的发现和判断。使用强措辞（"必须"/"不应该"），每条附具体理由。
> 这是报告的灵魂——决策者只读这一节也能抓住关键。

1. **[观点标题]** — [具体判断和理由]
2. **[观点标题]** — [具体判断和理由]
3. **[观点标题]** — [具体判断和理由]

## 2. 现状分析

### 技术栈概览

[当前使用的语言、框架、中间件、基础设施]

### 架构现状

```mermaid
[架构组件图 / 模块关系图 / 数据流图 — 选择最能揭示问题的类型，≤15 节点]
```

### 已识别的问题和风险

- [问题 1：描述 + 影响]
- [问题 2：描述 + 影响]

## 3. 核心维度评估

| 维度 | 评分(1-10) | 判定 | 关键发现 |
|------|-----------|------|---------|
| [维度名] | [分数] | ✅/⚠️/🚨 | [一句话发现] |

**评分标准参考:**
- 1-3 差: 严重不足，存在即时风险
- 4-6 中等: 低于或达到行业平均，需关注
- 7-8 良好: 高于行业平均，仍有优化空间
- 9-10 优秀: 业内领先，可作为标杆

### 3.N [维度名] 详细分析

**现状描述:** [客观描述当前状态]

**评分依据:** [引用具体评分标准说明为何给出此分数]

**问题与风险:**
- [具体问题及其影响]

**改进建议:**
- [具体可操作的建议]

[每个核心维度重复此子节]

## 4. 辅助维度评估

| 维度 | 风险等级(高/中/低) | 说明 |
|------|-------------------|------|
| [维度名] | [等级] | [简要说明] |

## 5. 风险情景分析

> 基于项目特征选择 2-3 个最相关情景进行 What-If 推演。

### 情景 N: [情景名]

- **薄弱环节:** [具体位置/组件]
- **影响评估:** [量化或定性描述影响程度]
- **建议措施:** [具体可操作的应对方案]
- **优先级:** ✅低 / ⚠️中 / 🚨高

## 6. 架构建议方案

### 方案 A: [名称]（推荐）

- **描述:** [方案概述]
- **优势:** [列出优势]
- **劣势:** [列出劣势]
- **预估投入:** [人力、时间、基础设施成本]

### 方案 B: [名称]

- **描述:** [方案概述]
- **优势:** [列出优势]
- **劣势:** [列出劣势]
- **预估投入:** [人力、时间、基础设施成本]

### 方案对比

```mermaid
[可选: 现状 vs 目标架构对比图 — 仅当对比有助理解时生成，≤15 节点]
```

## 7. 实施路线图

### 短期 (1-4 周)
- [优先级最高的改进项]

### 中期 (1-3 月)
- [核心架构改进]

### 长期 (3-6 月)
- [战略性架构演进]

### 风险缓解措施
- [关键风险及其缓解方案]

## 8. 总结与决策建议

**推荐方案:** [方案名] — [一句话理由]

**关键决策点:**
- [需要决策者拍板的事项]

**下一步行动项:**
- [ ] [具体行动 1]
- [ ] [具体行动 2]

---

## 附录: 架构决策记录 (ADR)

> Phase 2/3 中识别的关键架构决策点。每个决策按以下格式记录。
> 仅在用户明确要求时，将 ADR 生成为独立文件到 `docs/arch-brain/adrs/`。

### ADR-NNN: [决策标题]

**状态:** 建议
**日期:** YYYY-MM-DD

**上下文:** [为什么需要做这个决策]

**决策:** [具体的架构决策内容]

**后果:**
- 正面: [好处]
- 负面: [代价和风险]
- 中性: [需要注意的变化]
```

## Usage Notes

- Replace all `[placeholder]` text with actual analysis content
- Section 0 (Project Profile): Only include when codebase was analyzed; delete when in dialogue-only mode
- Section 1 (Core Opinions): Use strong advisor tone — "must", "should not", "do not"
- Section 3 sub-sections (3.1, 3.2, etc.): Only create for dimensions selected in Phase 3
- Mermaid diagrams: 1-2 per report, ≤15 nodes each, choose type by analysis context
- Risk scenarios (Section 5): Select 2-3 most relevant from standard scenario set
- Architecture proposals (Section 6): Always provide at least 2 options, recommend one
- ADR appendix: List all decision points identified during Phases 2-3
- Roadmap phases can be adjusted based on project urgency
- Save report to: `docs/arch-brain/reports/YYYY-MM-DD-<topic>.md`
