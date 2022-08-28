select
	cc."SQ_CANDIDATO",
	cc."NM_CANDIDATO",
	cc."DS_SIT_TOT_TURNO",
	sum(dcc."VR_DESPESA_CONTRATADA") as despesa
from
	consulta_cand cc
join despesas_contratadas_candidatos dcc on
	cc."SQ_CANDIDATO" = dcc."SQ_CANDIDATO"
where
	cc."DS_CARGO" in ('DEPUTADO ESTADUAL', 'DEPUTADO FEDERAL', 'SENADOR')
	and cc."DS_SITUACAO_CANDIDATURA" = 'APTO'
	and cc."DS_SIT_TOT_TURNO" in ('ELEITO', 'ELEITO POR MÉDIA', 'ELEITO POR QP', 'NÃO ELEITO')
	and cc."DS_COR_RACA" <> 'NÃO DIVULGÁVEL'
group by
	cc."SQ_CANDIDATO", 
	cc."NM_CANDIDATO",
	cc."DS_SIT_TOT_TURNO";
	
select
	distinct cc."DS_SIT_TOT_TURNO"
from
	consulta_cand cc;


------------------------------------------------------------------


select
	"NM_URNA_CANDIDATO"  
from
	consulta_cand cc
where
	"DS_CARGO"  in ('DEPUTADO ESTADUAL', 'DEPUTADO FEDERAL')
	and "DS_SITUACAO_CANDIDATURA"  in ('APTO')
	and "DS_SIT_TOT_TURNO"  in ('ELEITO POR MÉDIA', 'ELEITO POR QP', 'NÃO ELEITO')
	and "NM_URNA_CANDIDATO"  like any (array[
		'%DOUTOR%',
		'%DR %',
		'%DR.%',
		'%DRA.%'
	])
order by
	"NM_URNA_CANDIDATO"  asc;


------------------------------------------------------------------


select
	cc."SQ_CANDIDATO",
	cc."NM_URNA_CANDIDATO" ,
	cc."DS_SIT_TOT_TURNO",
	sum(dcc."VR_DESPESA_CONTRATADA") as DESPESA
from
	consulta_cand cc
join despesas_contratadas_candidatos dcc on
	cc."SQ_CANDIDATO" = dcc."SQ_CANDIDATO"
where
	cc."DS_CARGO" in ('DEPUTADO ESTADUAL', 'DEPUTADO FEDERAL', 'SENADOR')
	and cc."DS_SITUACAO_CANDIDATURA" = 'APTO'
	and cc."DS_SIT_TOT_TURNO" in ('ELEITO', 'ELEITO POR MÉDIA', 'ELEITO POR QP', 'NÃO ELEITO')
	and cc."DS_COR_RACA" <> 'NÃO DIVULGÁVEL'
	and "NM_URNA_CANDIDATO" like any (array[
	'%AGT.%',
	'%BOMBEIRO%',
	'%CABO%',
	'%CAP.%',
	'%CAPITAO%',
	'%CB%',
	'%CORONEL%',
	'%DELE.%',
	'%DELEGAD%',
	'%MAJOR%',
	'%POLICIAL%',
	'%SARG.%',
	'%SARGENTO%',
	'%SGT%',
	'%SOLDADO%',
	'%SUB TENENTE%',
	'%SUBOFICIAL%',
	'%SUBTEN%',
	'%TEN.%',
	'%TENENTE%'
	])
group by
	cc."SQ_CANDIDATO", 
	cc."NM_URNA_CANDIDATO",
	cc."DS_SIT_TOT_TURNO"
order by
	DESPESA asc;