# Cargamos las funciones que definimos para los modelos
# (A + B * V) / (C + H * exp((V + D) / F))

function alpha_n(V)
    if abs(V - 10) < 0.01
        return 0.1
    end
    0.01 * (10 - V) / (exp((10 - V) / 10) - 1)
end

beta_n(V) = 0.125 * exp(-V / 80)

alpha_m(V) = 0.1 * (25 - V) / (exp((25 - V) / 10) - 1)
alpha_h(V) = 0.07 * exp(-V / 20)

beta_m(V) = 4 * exp(-V / 18)
beta_h(V) = 1 / (exp((30 - V) / 10) + 1)

n_inf(alpha, beta) = [a / (a + b) for (a, b) in zip(alpha, beta)]
tau_inf(alpha, beta) = [1 / (a + b) for (a, b) in zip(alpha, beta)]
