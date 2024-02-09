using NetworkOptions

function fix_ssl()
    # Sustituimos el valor de la variable de ambiente
    SSL_CERT_FILE = NetworkOptions.bundled_ca_roots()
    ENV["SSL_CERT_FILE"] = "C:\\Users\\csmis\\.julia\\juliaup\\julia-1.10.0+0.x64.w64.mingw32\\share\\julia\\cert.pemenv"
    # ENV["JULIA_SSL_CA_ROOTS_PATH"] = ""
end

fix_ssl()
ENV["JULIA_SSL_CA_ROOTS_PATH"] = ""
# Ahora si podemos crear el paquete usando

# ]generate RedesNeuronalesJuliaFCiencias


# Luego nos movemos al directorio
# y activamos el ambiente de desarrollo

# ]activate .
