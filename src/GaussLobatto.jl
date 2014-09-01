function GaussLobatto( n )
# Gauss-Legendre-Lobatto Quadrature Nodes and Weights

    if ( n == 1 )
        error("Lobatto undefined for n = 1.")
    elseif ( n == 2 )
        x = ([-1.0,1.0],[1.0,1.0])
    elseif ( n == 3 )
        x = ([-1, 0, 1], [1.0, 4.0, 1.0]/3)
    else
        # Compute via GaussJacobi:
        x = GaussJacobi(n - 2, 1.0, 1.0)
        w = x[2]; x = x[1];
        x = [-1, x, 1]
        w = [-1, w, 1]
        w = w./(1-x.^2)
        w[1] = 2/(n*(n - 1))
        w[n] = 2/(n*(n - 1))
        x = (x,w)
    end
    return x
end