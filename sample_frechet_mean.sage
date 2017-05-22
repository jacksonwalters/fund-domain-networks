def proc_dist(s1,s2): return min([(vector(act_vect(g,vector(s2)))-vector(s1)).norm() for g in G])
	
def sample_frechet_mean(s1,s2):
	F_l=fund_domain()[1]
	
	orb1 = [act_vect(g,vector(s1)) for g in G]
	orb2 = [act_vect(g,vector(s2)) for g in G]
	
	domains1 = [fund_domain(o1)[1] for o1 in orb1]
	domains2 = [fund_domain(o2)[1] for o2 in orb2]
	
	avgs = []
	
	for i in range(len(orb1)):
		for j in range(len(orb2)):
			R = domains1[i].intersection(domains2[j])
			avg=(orb1[i]+orb2[j])/2
			if R.contains(avg): avgs.append(avg)
	
	max_norm = max([av.norm() for av in avgs])
	maxes=[]
	for av in avgs: 
		if av.norm() == max_norm: maxes.append(av)
	
	domain_reps=[tuple(fund_domain_rep(m,F_l)) for m in maxes]
	
	return [vector(s) for s in set(domain_reps)]
	