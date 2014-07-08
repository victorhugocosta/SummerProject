spectrum <- function
### Computes spectrum of a signal
(xs,
### input 1D signal
 fs
### sampling rate (n samples per second)
){
  # Compute FFT of the signal and get its magnitude
  # |x + iy| = sqrt(x^2 + y^2)
  magnitudes <- abs(fft(xs))
  n <- length(magnitudes)
  # Compute corresponding frequencies of the signal
  # assuming we are sampling at fs = 6Hz:
  # 0Hz <-> magnitudes[1]
  # ...
  # 6 / (n-1) * i <-> magnitudes[i+1]
  # ...
  # 6Hz <-> magnitudes[n]
  frequencies <- unlist(Map(function(i) fs / (n-1) * i, 0:(n-1)))

  return(list(frequencies[1:(n %/% 2)], magnitudes[1:(n %/% 2)]))
}
