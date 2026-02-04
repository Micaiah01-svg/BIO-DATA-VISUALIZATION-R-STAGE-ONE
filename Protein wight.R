#TASK 2
aa_table <- data.frame(
  one_letter = c("A","R","N","D","C","E","Q","G","H","I","L","K","M",
                 "F","P","S","T","W","Y","V"),
  weight = c(89.09, 174.20, 132.12, 133.10, 121.15, 147.13, 146.15, 
             75.07, 155.16, 131.18, 131.18, 146.19, 149.21, 165.19, 
             115.13, 105.09, 119.12, 204.23, 181.19, 117.15)
)
protein_weight <- function(protein = "YourName") {
  # Convert to uppercase
  protein <- toupper(protein)
  
  # Split into characters
  aa_vector <- strsplit(protein, "")[[1]]
  
  total_weight <- 0
  
  for (aa in aa_vector) {
    # Does this amino acid exist in table?
    if (aa %in% aa_table$one_letter) {
      # Add its weight
      total_weight <- total_weight + aa_table$weight[aa_table$one_letter == aa]
    } else {
      # Invalid amino acid → return 0 immediately
      return(0)
    }
  }
  
  # Convert Da → kDa
  return(total_weight / 1000)
}

# Examples:
protein_weight("ACDE")
protein_weight("ACXB")   # Contains invalid "X" and "B" → returns 0
