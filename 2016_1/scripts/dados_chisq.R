res = c("AR", "AE", "VR", "VE")
freq_obs = c(315,101,108,32)
prob_esp = c(9/16,3/16,3/16,1/16)

mendel = data.frame(res, freq_obs, prob_esp)

sum(mendel$freq_obs)*mendel$prob_esp

mendel$freq_esp = sum(mendel$freq_obs)*mendel$prob_esp

desvios = ((mendel$freq_obs-mendel$freq_esp)^2)/mendel$freq_esp

chi = sum(desvios)

#Se p-valor é maior que 0.05, continuo com H0 (meu modelo é adequado!)
p-valor = pchisq(chi, df=length(res)-1, lower.tail = F)
