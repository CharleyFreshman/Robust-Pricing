# 价格公平约束下的鲁棒定价
## Robust Pricing under Distributional Uncertainty

本项目研究**分布不确定环境下、带价格公平约束的差异化定价问题**，对应本科毕业论文：

> **《价格公平约束下基于均值-支撑集的鲁棒定价研究》**  
> 上海财经大学，2026

考虑一个面向多个异质顾客群体定价的垄断企业。企业无法准确获知顾客估值的真实概率分布，只掌握各群体估值的**均值与支撑集（Mean-Support Set）**。

在此有限信息条件下，企业需要为不同群体制定价格，在满足价格公平约束的同时，最大化**最坏情形下的期望利润（Worst-case Expected Profit）**。

对于任意两个群体，公平约束要求：

\[
|p_i-p_j|\leq \Delta
\]

其中 \(\Delta\) 为价格差异容忍度。\(\Delta\) 越小，公平约束越严格。

---

## 研究问题

现有公平定价研究通常假设企业已知完整的需求或顾客估值分布，而现实市场中企业往往只能获得有限的统计信息。

本研究关注：

> **当企业无法准确知道市场分布时，价格公平约束会如何改变最优定价策略？**

具体考察三个问题：

1. 在仅知道顾客估值均值与支撑集的情况下，如何构造鲁棒最优价格？
2. 随着公平约束 \(\Delta\) 逐渐收紧，最优定价结构如何演变？
3. 公平约束如何影响生产者利润、消费者剩余与社会福利？

---

## 模型与方法

### 1. 均值-支撑集不确定性

不预先假定顾客估值服从某个具体参数分布，而是考虑所有满足以下信息的概率分布：

- 已知估值支撑集；
- 已知估值均值；
- 具体概率分布未知。

因此企业面对的是一个分布集合，而非单一需求分布。

企业求解：

\[
\max_{p}\min_{F\in\mathcal{F}}\mathbb{E}_F[\Pi(p)]
\]

即选择能够**最大化最坏分布下期望利润**的价格。

---

### 2. 对偶化与解析求解

单群体情况下，内层最坏分布问题可以表示为带矩约束的无限维线性规划。

通过对偶理论，可以将其转化为有限维问题，并得到单群体鲁棒利润函数及其最优价格的闭形式表达。

在此基础上进一步构造两群体与多群体公平定价模型。

---

### 3. 公平约束下的两个最优性条件

对于两群体问题，当公平约束生效时，最优价格具有两个重要结构性质。

#### 边界上最优

最优价格差会完全使用允许的公平区间：

\[
p_2-p_1=\Delta
\]

#### 边际利润平衡

沿公平约束边界调整价格时，最优解满足：

\[
\pi_1'(p_1)+\pi_2'(p_2)=0
\]

利用这两个条件，可以进一步刻画不同参数区域下的最优价格结构与临界公平约束。

---

## 核心发现：公平约束存在两种完全不同的作用机制

随着 \(\Delta\) 减小，公平约束逐渐收紧，最优价格并不一定平滑地趋向统一价格。

研究发现存在两种不同机制。

### ① 连续压缩（Continuous Compression）

当公平约束适中时，两类顾客仍然同时被服务。

价格沿公平约束边界逐渐靠近：

\[
p_2-p_1=\Delta
\]

企业通过牺牲部分差异化定价能力满足公平要求，价格结构连续变化。

### ② 跳跃退出（Jump Abandonment）

当不同群体之间的估值差异较大时，会出现一个临界公平水平：

\[
\Delta^*
\]

当公平约束严格到

\[
\Delta<\Delta^*
\]

企业继续压缩价格可能已经不再最优。

此时最优策略可能发生**非连续跳跃（Price Jump）**：

- 放弃低估值群体；
- 将其对应利润降为零；
- 定价重心转向高估值群体；
- 企业利润重新锁定在新的最优结构。

因此，更严格的公平约束并不必然导致价格平滑地趋于一致，也可能直接改变企业所服务的市场范围。

---

## 三群体与多群体扩展

项目进一步将两群体模型扩展至三个顾客群体。

随着公平约束由宽松逐渐变严格，最优价格可能经历以下阶段：

```text
无约束最优定价
      ↓
外围压缩
      ↓
价格捆绑
      ↓
可能发生跳跃 / 群体退出
      ↓
价格进一步压缩
      ↓
统一定价
```

### 阶段 1：外围压缩

最低估值群体与最高估值群体首先受到公平约束影响并相互靠近，而中间群体暂时保持其无约束最优价格。

### 阶段 2：价格捆绑

随着 \(\Delta\) 继续减小，某个外围群体的价格可能与中间群体重合。

两个群体形成一个新的**价格簇（Price Cluster）**，随后作为整体继续调整。

### 阶段 3：价格统一

当

\[
\Delta\rightarrow0
\]

所有群体最终被要求采用相同价格。

### 特殊阶段：跳跃退出

如果某个低估值群体的潜在利润过低，企业可能在价格完全统一之前提前放弃该群体。

三群体情况下甚至可能发生多次跳跃。

因此，多群体情形可以概括为一种层级化的：

> **压缩 → 捆绑 → 跳跃 → 降维 → 继续压缩 → 最终统一**

的结构演化过程。

这一规律还可以自然推广至一般的 \(n\) 群体情形。

---

## 数值实验

理论结果通过数值优化与两类具体估值分布进行验证。

### 均匀分布

`Robust_Pricing_Uniform.ipynb`

分析内容包括：

- 两群体最优鲁棒定价；
- 不同均值参数区域；
- 公平约束敏感性；
- 临界 \(\Delta^*\)；
- 定价跳跃；
- 生产者利润；
- 消费者剩余；
- 社会福利。

### 对称三角分布

`Robust_Pricing_Triangular.ipynb`

将相同鲁棒策略代入对称三角估值分布，研究：

- 不同真实分布下鲁棒策略的表现；
- 公平约束与分布形态之间的相互作用；
- 跳跃点附近的福利变化；
- 与均匀分布实验的差异。

### 多群体模型

`Robust_Pricing_Multiple.ipynb`

主要验证：

- 多群体价格压缩；
- 价格捆绑；
- 群体退出；
- 多阶段跳跃；
- 最优价格随 \(\Delta\) 的敏感性。

---

## 数值求解

项目结合解析推导与数值优化验证理论结果。

### SLSQP

在不存在跳跃时，目标函数在相关可行区域内具有较好的单峰结构，因此使用：

```python
scipy.optimize.minimize(..., method="SLSQP")
```

求解带公平约束的最优价格。

### Basin-hopping

当存在价格跳跃时，目标函数可能出现多个局部最优区域。

因此使用：

**Basin-hopping + SLSQP**

进行全局搜索：

1. SLSQP 求局部最优；
2. 对当前解进行随机扰动；
3. 根据接受准则进入新的搜索区域；
4. 重复局部优化；
5. 比较不同局部最优解。

从而降低跳跃情形下陷入局部极值的风险。

### 符号计算

部分临界条件、分段表达式与跳跃点分析使用 `SymPy` 完成符号推导，并通过数值计算进行验证。

---

## 福利分析

数值实验进一步比较：

- **生产者利润（Producer Profit）**
- **消费者剩余（Consumer Surplus）**
- **社会福利（Social Welfare）**

并将鲁棒定价策略与已知真实分布情况下的最优定价进行比较。

### 鲁棒策略的利益再分配

在论文所考察的均匀分布和对称三角分布数值实验中，鲁棒定价表现出稳定的利益再分配特征：

- 生产者利润下降；
- 消费者剩余增加；
- 社会福利提高。

这意味着最大化最坏情形利润所产生的保守定价，会将部分生产者利益转移给消费者。

---

## 公平约束的非连续福利效应

公平约束的影响取决于最优价格是否发生跳跃。

### 未发生跳跃

公平约束逐渐收紧时，消费者可以从价格差异压缩中受益。

### 发生跳跃

当 \(\Delta\) 穿过临界值后：

- 低估值群体退出市场；
- 生产者利润出现提升；
- 消费者剩余突然下降；
- 社会福利出现明显下降。

因此，过于严格的价格公平约束可能产生一个反直觉结果：

> **形式上缩小了不同群体之间的价格差异，却可能使低估值群体直接失去交易机会。**

---

## 分布形态的影响

均匀分布和对称三角分布实验表现出相同方向的鲁棒利益再分配效应，但具体幅度和随公平约束变化的轨迹并不相同。

在论文所测试的相同参数下，对称三角分布中的鲁棒代入利润高于均匀分布中的对应结果。

这表明真实估值分布的形态会显著影响：

- 鲁棒定价的保守程度；
- 企业承担的信息不完全成本；
- 公平约束的最优校准位置；
- 利润、消费者剩余与社会福利之间的权衡。

---

## 项目结构

| 文件 | 内容 |
|---|---|
| `Robust_Pricing_Uniform.ipynb` | 均匀分布下两群体鲁棒定价、分段最优解、跳跃点与福利分析 |
| `Robust_Pricing_Triangular.ipynb` | 对称三角分布、SymPy 符号推导、跳跃验证及分布对比 |
| `Robust_Pricing_Multiple.ipynb` | 三群体/多群体价格压缩、捆绑、跳跃与敏感性分析 |
| `论文终极版-ssf.pdf` | 完整论文及理论推导 |

---

## 依赖

```bash
numpy
scipy
sympy
pandas
matplotlib
seaborn
```

在 Jupyter Notebook 中按顺序运行各单元格即可复现实验。

---

## 核心结论

本研究最核心的结果可以概括为：

> **公平约束收紧并不意味着差异化价格只会连续地趋向统一价格。**
>
> 在分布不确定环境下，适度公平约束会压缩群体间价格差异；当约束超过某个临界水平后，企业可能直接放弃低估值群体，使最优定价发生结构性跳跃。

因此，鲁棒定价中的公平问题不仅是：

**“不同群体应该相差多少钱？”**

还涉及：

**“当价格差异受到严格限制后，企业是否仍愿意服务所有群体？”**


# Robust Pricing under Distributional Uncertainty

This project studies **distributionally robust personalized pricing under price-fairness constraints**.  
A monopolistic seller does not know the exact valuation distributions of customer groups, but only their **means and supports**. The seller chooses group-specific prices to maximize **worst-case expected profit**, subject to a fairness constraint

\[
|p_i-p_j|\leq \Delta,
\]

where smaller \(\Delta\) represents stricter price fairness.

The project contains the analytical derivations and numerical experiments for my undergraduate thesis:

> **Robust Pricing Based on Mean-Support Sets under Price Fairness Constraints**  
> Shanghai University of Finance and Economics, 2026

---

## Research Question

Most fairness-aware pricing models assume that the seller knows the underlying demand or valuation distribution.

Here the distribution itself is uncertain.

For each customer group, the seller only observes:

- valuation support,
- mean valuation,
- unit production cost,

and considers all distributions consistent with this limited information.

The resulting problem is a **max-min pricing problem**:

1. the seller chooses prices;
2. nature selects the worst admissible valuation distributions;
3. prices must simultaneously satisfy cross-group fairness constraints.

The objective is to understand how fairness regulation changes robust pricing decisions when market information is incomplete.

---

## Methodology

### 1. Mean-support ambiguity set

Instead of assuming a parametric demand distribution, customer valuations are allowed to follow any distribution satisfying the known mean and support.

The inner worst-case distribution problem can be formulated as an infinite-dimensional linear program.

Using duality, the inner problem is reduced to a tractable deterministic robust-profit function.

### 2. Analytical characterization

For the two-group problem, the optimal solution is characterized using two structural conditions:

- **Boundary optimality:** when the fairness constraint binds, the optimal price difference satisfies  
  \[
  p_2-p_1=\Delta.
  \]

- **Marginal-profit balance:** along the binding fairness boundary, the optimal prices satisfy  
  \[
  \pi_1'(p_1)+\pi_2'(p_2)=0.
  \]

These conditions allow the pricing problem to be classified analytically into different regimes.

### 3. Numerical optimization

The analytical results are verified numerically using:

- **SLSQP** for locally unimodal regimes;
- **Basin-hopping + SLSQP** when price jumps create multiple local optima;
- **SymPy** for symbolic derivations and critical-point calculations;
- **SciPy** for numerical optimization and verification.

---

## Main Structural Result

As the fairness tolerance \(\Delta\) decreases, optimal pricing does not necessarily converge smoothly toward uniform pricing.

Two qualitatively different mechanisms can occur.

### Continuous compression

Under moderate fairness constraints, prices move continuously toward each other:

\[
p_2-p_1=\Delta.
\]

The seller continues serving both customer groups while sacrificing some pricing flexibility.

### Jump abandonment

When customer groups are sufficiently heterogeneous, there exists a critical fairness level \(\Delta^*\).

Once

\[
\Delta < \Delta^*,
\]

the optimal pricing policy can change discontinuously.

Instead of continuing to compress prices, the seller may optimally **abandon the lower-valuation group** and shift pricing toward the high-valuation group.

This creates a discontinuous **price jump**.

---

## Multi-group Extension

The model is also extended from two customer groups to three groups.

As fairness becomes stricter, optimal prices can follow a multi-stage path:

```text
Unconstrained pricing
        ↓
Outer-group compression
        ↓
Price bundling
        ↓
Possible group abandonment / price jump
        ↓
Uniform pricing