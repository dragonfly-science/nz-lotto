data {
  int<lower = 1> K;
  int<lower = 1> N;
  real<lower = 0> alpha;
  int<lower = 1> results[N];
}
generated quantities {
  vector[K] theta = dirichlet_rng(rep_vector(alpha, K));
  int<lower = 1> ranking[K];

  ranking = sort_indices_asc(theta);
  results = head(ranking, N);
}
