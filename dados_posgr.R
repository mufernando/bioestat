pos = c(29, 24, 24, 22, 22, 21, 24, 27,25)
gr = c(23, 20, 22, 22, 20)
pos
gr
m_pos = mean(pos)
m_gr = mean(gr)
m_pos
m_gr
n_pos = length(pos)
n_gr = length(gr)
tc_pos = qt(0.025, df=n_pos-1, lower.tail=F)
tc_gr = qt(0.025, df=n_gr-1, lower.tail=F)
tc_pos
tc_gr
e_pos=tc_pos*(sqrt(var(pos)/n_pos))
e_gr=tc_gr*(sqrt(var(gr)/n_gr))

m_pos-e_pos
m_pos+e_pos

m_gr-e_gr
m_gr+e_gr

sp = ((var(pos)*(n_pos-1))+(var(gr)*(n_gr-1))
      )/(n_pos+n_gr-2)

t_obs = (m_pos-m_gr)/sqrt(sp*((1/n_pos)+(1/n_gr)))

pt(t_obs, df=(n_pos+n_gr-2), lower.tail=F)

t.test(pos, gr, alternative="greater", 
       var.equal=T)

t.test(pos, mu=24)

m = lm(pos[1:5]~gr)

