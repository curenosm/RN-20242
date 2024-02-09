function main()
    println("Hello world")
    println("Introduzca el numero de capas de la red neuronal: ")
    
    capas = 5
    println("El numero de capas es: ", capas)

    neuronas = [2, 3, 4, 5, 1]
    println("El numero de neuronas por capa es: ", neuronas)

    x = [1, 2]
    println("El vector de entrada es: ", x)

    pesos = [
        [1, 1],
        [1, 1, 1],
        [1, 1, 1, 1],
        [1, 1, 1, 1, 1],
        [1]
    ]
    println("Los pesos son: ", pesos)

    bias = [1, 1, 1, 1, 1]
    println("Los bias son: ", bias)

    for i in 1:capas
        x = forward(x, pesos[i], bias[i])
        println("El resultado de la capa ", i, " es: ", x)
    end

    println("El resultado de la red neuronal es: ", x)

end

function forward(x, w, b)
    return perceptron(x, w, b)
end

function dot(x, w)
    return sum(x .* w)
end

function funcion_de_activacion(x)
    if x > 0
        return 1
    else
        return 0
    end
end

function perceptron(x, w, b)
    return funcion_de_activacion(dot(x, w) + b)
end

main()
