#!/usr/bin/env bash
# Calculate simple interest: principal * annual rate * time / 100.

echo "Simple Interest Calculator"
read -r -p "Enter principal amount: " principal || exit 1
read -r -p "Enter annual rate of interest (%): " rate || exit 1
read -r -p "Enter time period (in years): " time || exit 1

# Accept non-negative whole numbers or decimal values.
number_pattern='^[0-9]+([.][0-9]+)?$'
for value in "$principal" "$rate" "$time"; do
  if [[ ! $value =~ $number_pattern ]]; then
    echo "Error: enter a non-negative number for each input." >&2
    exit 1
  fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" \
  'BEGIN { printf "%.2f", (p * r * t) / 100 }')
echo "Simple interest: $interest"
