# Robust Pricing under Distributional Uncertainty

分布不确定下的鲁棒定价：当需求分布仅部分已知（围绕名义分布存在扰动 Δ）时，
求解**最大化最坏情形收益**的定价策略，并分析最优价格随扰动幅度的敏感性。

## Notebooks

| 文件 | 内容 |
|---|---|
| `Robust_Pricing_Multiple.ipynb` | 多类客户细分定价；最优价格随 Δ 变化的敏感性分析 |
| `Robust_Pricing_Triangular.ipynb` | 三角分布模糊集；sympy 符号推导 + 跳跃点检验 |
| `Robust_Pricing_Uniform.ipynb` | 均匀分布模糊集；分段最优解（p2* ≷ μ1 两种 regime）与跳跃点解析 |

## 方法与依赖

- 符号推导：`sympy`；数值验证与优化：`scipy`
- 可视化：`matplotlib` / `seaborn`（最优价格-收益曲线、随 Δ 的敏感性、最优解跳跃现象）
- 复现：Jupyter 中按序运行单元格即可，依赖
  `numpy scipy sympy pandas matplotlib seaborn`
