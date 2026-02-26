FAIR Actuary

Structural Attribution Diagnostic for Loss Reserving

FAIR Actuary (Factor Attribution for Insurance Risk) is a Shapley-based framework for decomposing aggregate claim evolution into:
	•	Frequency
	•	Severity
	•	Inflation

while testing whether such decomposition is structurally reliable.

The framework introduces the Risk Attribution Index (RAI), a separability diagnostic distinguishing:
	•	Valid attribution
	•	Partial separability
	•	Structural ambiguity

⸻

🔬 Methodological Layers
	1.	Filtering layer – Factor construction from loss triangles
	2.	Association layer – GLM-based log-linear modelling
	3.	Allocation layer – Shapley value decomposition
	4.	Diagnostic layer – RAI separability test

⸻

📊 Validation Benchmarks

Validated on:
	•	RAA Loss Development Triangle
	•	CAS Loss Reserve Database

Demonstrates:
	•	Correct identification of non-separable structures (RAA)
	•	Reliable differentiated attribution when separability exists (CAS)

⸻

🚀 Demo Application

Interactive demonstration:

https://1tw69i-eytan-ellenberg.shinyapps.io/fair-actuary/

⸻

📂 Repository Structure
	•	r/ R implementation
	•	python/ Python implementation
	•	simulation_validation Monte Carlo separability validation
	•	manuscript/ Academic paper
	•	shiny/ Demo app

⸻

📜 Citation

If you use FAIR Actuary, please cite:

Ellenberg, E. (2026). FAIR Actuary: Structural Attribution Diagnostic for Frequency–Severity–Inflation Decomposition.

⸻

⚖ License

MIT License
