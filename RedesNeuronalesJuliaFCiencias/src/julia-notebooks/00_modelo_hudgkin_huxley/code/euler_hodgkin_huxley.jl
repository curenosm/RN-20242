using GLMakie


"""
Función que recibe los resultados de la simulación y grafica los mismos
utilizando la API de Makie.
"""
function plot_simulation(resultados)
    t = resultados["t"] !== nothing ? resultados["t"] : 0:0.1:50

    fig = Figure(size=(800, 800))

    axez = [
        Axis(fig[1, 1],
            title="Voltaje en la membrana",
            xlabel=L"\textit{Tiempo (ms)}",
            ylabel=L"\textit{Voltaje relativo en la membrana (mV)}",
            xticks=[0, 10, 20, 30, 40, 50],
            yticks=[-20, 0, 20, 40, 60, 80, 100, 120]
        ),
        Axis(fig[1, 2],
            title="Conductancia de los canales",
            xlabel=L"\textit{Tiempo (ms)}",
            ylabel=L"\textit{Conductancia (mS/cm^2)}",
            xticks=[0, 10, 20, 30, 40, 50],
            yticks=[0, 5, 10, 15, 20, 25, 30]
        ),
        Axis(fig[2, 1],
            title="Tasas de transición",
            xlabel=L"\textit{Tiempo } (ms)",
            ylabel=L"\textit{adimensional}",
            xticks=[0, 10, 20, 30, 40, 50],
            yticks=[0, 0.2, 0.4, 0.6, 0.8, 1]
        ),
        Axis(fig[2, 2],
            title="Constantes temporales",
            xlabel=L"\textit{Tiempo } (ms)",
            ylabel=L"\textit{τ(ms)}",
            xticks=[0, 10, 20, 30, 40, 50],
            yticks=[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
        ),
    ]

    lines!(axez[1], t, resultados["V"], color=:dodgerblue, label=L"V", linewidth=2)
    lines!(axez[2], t, resultados["gK"], color=:dodgerblue, label=L"G_K", linewidth=2)
    lines!(axez[2], t, resultados["gNa"], color=:red, label=L"G_{Na}", linewidth=2)
    lines!(axez[3], t, resultados["n"], color=:dodgerblue, label=L"n", linewidth=2)
    lines!(axez[3], t, resultados["m"], color=:red, label=L"m", linewidth=2)
    lines!(axez[3], t, resultados["h"], color=:mediumpurple, label=L"h", linewidth=2)
    lines!(axez[4], t, resultados["τ_n"], color=:dodgerblue, label=L"τ_{n}", linewidth=2)
    lines!(axez[4], t, resultados["τ_m"], color=:red, label=L"τ_{m}", linewidth=2)
    lines!(axez[4], t, resultados["τ_h"], color=:mediumpurple, label=L"τ_{h}", linewidth=2)

    limits!(axez[1], -10, 50, -20, 120)
    limits!(axez[2], -10, 50, 0, 30)
    limits!(axez[3], -10, 50, 0, 1)
    limits!(axez[4], -10, 50, 0, 9)

    axislegend(axez[1], unique=false, merge=true, position=:rt)
    axislegend(axez[2], unique=false, merge=true, position=:rt)
    axislegend(axez[3], unique=false, merge=true, position=:rt)
    axislegend(axez[4], unique=false, merge=true, position=:rt)

    fig
end