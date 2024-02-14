V0_slider = Slider(fig[2, 2], range = -90:1:120, startvalue = parametros["V0"])
curent_slider = Slider(fig[2, 3], range = -10:0.1:10, startvalue = 2.4)

t0 = 10.0
t_fin = 16.0

points = lift(step_slider.value) do step
    xs = min_x:step:max_x
    ys = beta_n.(xs)
    res_points = [(x, y) for (x, y) in zip(xs, ys)]
    [Point2f(x, y) for (x, y) in res_points]
end
