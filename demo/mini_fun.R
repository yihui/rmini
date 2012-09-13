pb = txtProgressBar(min = 0, max = 100)
for(i in 1:100) {
  Sys.sleep(0.1)
  setTxtProgressBar(pb, i)
}
close(pb)
