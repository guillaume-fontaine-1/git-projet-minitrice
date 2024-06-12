#!/bin/bash

# Fonction pour générer un nombre aléatoire entre 1 et 1000
generate_random_number() {
    echo $((RANDOM % 1000 + 1))
}

# Fonction pour générer un opérateur aléatoire
generate_random_operator() {
    operators=('+' '-' '*' '/')
    echo "${operators[$((RANDOM % 4))]}"
}

# Fonction principale pour générer des expressions
generate_expressions() {
    count=$1
    for ((i = 0; i < count; i++)); do
        num1=$(generate_random_number)
        num2=$(generate_random_number)
        operator=$(generate_random_operator)
        echo "$num1$operator$num2"
    done
}

# Vérifier si le nombre d'expressions est fourni comme argument
if [ -z "$1" ]; then
    echo "Usage: $0 <nombre_d_expressions>"
    exit 1
fi

# Générer les expressions
generate_expressions $1
