"""
Probabilidad de que la puerta transite de cerrada a abierta.
"""
alpha_h(V) = 0.07 * exp(-V / 20)

"""
Probabilidad de que la puerta de iones de sodio transite de cerrada a abierta.
"""
function alpha_m(V)
    _alpha_m(V) = 0.1 * (25 - V) / (exp((25 - V) / 10) - 1)

    if typeof(V) <: AbstractArray
        return broadcast(item -> abs(item - 25) < epsilon ? 0.1 : item, V)
    end

    return V == 25 ? 0.1 : _alpha_m(V)
end

"""
Probabilidad de que la puerta de iones de potasio transite de cerrada a abierta.
"""
function alpha_n(V)
    _alpha_n(V) = 0.01 * (10 - V) / (exp((10 - V) / 10) - 1)

    if typeof(V) <: AbstractArray
        return broadcast(item -> abs(item - 10) < epsilon ? 0.1 : item, V)
    end

    return V == 10 ? 0.1 : _alpha_n.(V)
end

"""
Probabilidad de que la puerta transite abierta a cerrada.
"""
beta_h(V) = 1 / (exp((30 - V) / 10) + 1)
beta_m(V) = 4 * exp(-V / 18)
beta_n(V) = 0.125 * exp(-V / 80)

"""
Probabilidad de compuerta abierta en el equilibrio cuando t -> ∞.
"""
function n_inf(α, β)
    if typeof(α) <: AbstractArray && typeof(β) <: AbstractArray
        return [a / (a + b) for (a, b) in zip(α, β)]
    end

    α / (α + β)
end

"""
Tiempo que toma llegar al equilibrio cuando t -> ∞.
"""
function tau_inf(α, β)
    if typeof(α) <: AbstractArray && typeof(β) <: AbstractArray
        return [1 / (a + b) for (a, b) in zip(α, β)]
    end

    1 / (α + β)
end

g_na(constant, m, h) = constant .* m .^ 3 .* h
g_k(constant, n) = constant .* n .^ 4
