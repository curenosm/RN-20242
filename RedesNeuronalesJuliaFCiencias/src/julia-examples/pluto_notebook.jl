### A Pluto.jl notebook ###
# v0.19.38

using Markdown
using InteractiveUtils

# ╔═╡ c2e325a0-c763-11ee-03d4-f172a3285e1b
"""
Función para calcular la probabilidad de que la compuerta esté cerrada
de acuerdo al voltaje pasado como argumento.
"""
function alpha_n(V)
	function _alpha_n(V)
		# Fórmula genérica para calcular alfa cuando V != 10
		A = 0.1
		B = -0.01
		C = -1
		D = -10
		F = -10
		H = 1
		return (A + B * V) / (C + H * exp((V + D) / F))
	end

	epsilon = 0.00001
	if V == 10
		return 0.1
	else
		return _alpha_n(V)
	end
end

# ╔═╡ 8c323089-c187-415d-a844-83f0f0d0c82b
alpha_n(10)

# ╔═╡ 9cf7f832-7d61-498a-88d7-13a6c5025ddc


# ╔═╡ Cell order:
# ╠═c2e325a0-c763-11ee-03d4-f172a3285e1b
# ╠═8c323089-c187-415d-a844-83f0f0d0c82b
# ╠═9cf7f832-7d61-498a-88d7-13a6c5025ddc
