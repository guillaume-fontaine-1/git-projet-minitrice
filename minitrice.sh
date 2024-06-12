#!/bin/bash

# Fonction pour l'addition
addition() {
    echo $(( $1 + $2 ))
}

# Fonction pour la soustraction
soustraction() {
    echo $(( $1 - $2 ))
}

# Fonction pour la multiplication
multiplication() {
    echo $(( $1 * $2 ))
}

# Fonction pour la division
division() {
    if [ $2 -ne 0 ]; then
        echo $(( $1 / $2 ))
    else
        echo "Erreur: Division par zéro"
    fi
}

# Fonction pour évaluer une expression
evaluate_expression() {
    case $2 in
        +)
            addition $1 $3
            ;;
        -)
            soustraction $1 $3
            ;;
        \*)
            multiplication $1 $3
            ;;
        /)
            division $1 $3
            ;;
        *)
            echo "Opérateur invalide"
            return 1
            ;;
    esac
}

# Fonction pour vérifier si une chaîne est un nombre valide
is_number() {
    [[ $1 =~ ^[0-9]+(\.[0-9]+)?$ ]]
}

# Fonction principale
main() {

    while true; do
        # Lire une ligne de l'entrée standard
        if ! read -p ">> " input; then
            # Si read échoue, cela signifie que EOF (Ctrl + D) a été détecté
            break
        fi

        # Supprimer les espaces autour de l'entrée
        input=$(echo "$input" | tr -d ' ')

        # Extraire les opérandes et l'opérateur
        if [[ "$input" =~ ^([0-9]+(\.[0-9]+)?)?([-+\*/])([0-9]+(\.[0-9]+)?)?$ ]]; then
            num1="${BASH_REMATCH[1]}"
            operator="${BASH_REMATCH[3]}"
            num2="${BASH_REMATCH[4]}"

            # Vérifier que num1 et num2 sont des nombres valides
            if is_number "$num1" && is_number "$num2"; then
                # Évaluer l'expression
                result=$(evaluate_expression "$num1" "$operator" "$num2")

                # Afficher le résultat
                if [[ $? -eq 0 ]]; then
                    echo "$input = $result"
                fi
            else
                echo "Erreur de syntaxe pour le calcul: \"$input\""
            fi
        else
            echo "Erreur de syntaxe pour le calcul: \"$input\""
        fi
    done
}

# Appeler la fonction principale
main
