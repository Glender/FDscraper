library(devtools)

load_all()

document()

check()


x <- extract_balance_data("https://beurs.fd.nl/noteringen/11755/ahold-delhaize/kerncijfers")

urls <- c(
  "https://beurs.fd.nl/analyse/amsterdam/aex/",
  "https://beurs.fd.nl/analyse/amsterdam/midkap/"
)

websites <- scrape_fd_urls(urls)
data <- scrape_fd_data(websites)

library(BenfordStats)

results <- data[!is.na(data)]

#
first_d <- first_digit(results)
expected <- round(BenfordStats::prob_first_digit(1:9), 2)

#
plot <- barplot(
  prop.table(table(first_d)),
  ylim=c(0, .4),
  col= "#75AADB",
  main="Do X conform to Benford's Law?",
  xlab = "First Digit",
  ylab = "Probability of first digit"
)

lines(x = plot, y = expected)
points(x = plot, y = expected)


