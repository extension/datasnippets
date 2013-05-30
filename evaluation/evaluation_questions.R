# focus on public evaluations only
public_submitted_questions = subset(aae_evaluation_2013.22, aae_evaluation_2013.22$has_extension_account == 'false')
public_evaluation_eligible_questions = subset(public_submitted_questions, public_submitted_questions$evaluation_eligible == 'true')

# histogram of 
evaluation_histogram = hist(public_evaluation_eligible_questions$evaluation_count, breaks = 11, plot = FALSE)
