f = Figure()

traces = cumsum(randn(10, 5), dims = 1)

for (i, (merge, unique)) in enumerate(
        Iterators.product([false, true], [false true]))

    axis = Axis(f[fldmod1(i, 2)...],
        title = "merge = $merge, unique = $unique")

    for trace in eachcol(traces)
        lines!(trace, label = "single", color = (:black, 0.2))
    end

    mu = vec(sum(traces, dims = 2) ./ 5)
    lines!(mu, label = "mean")
    scatter!(mu, label = "mean")

    axislegend(axis, merge = merge, unique = unique)

end

f