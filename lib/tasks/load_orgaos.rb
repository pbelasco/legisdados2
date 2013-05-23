#encoding: utf-8
Membership.each {|m| m.destroy}
Orgao.each {|m| m.destroy}
Parlamentar.each {|m| m.destroy}


@doc = Nokogiri::XML(open "http://www.camara.gov.br/SitCamaraWS/Orgaos.asmx/ObterOrgaos")
@doc.xpath("//orgao").each do |a| 
	o = Orgao.new(:sigla => a.attr("sigla").strip, :descricao =>  a.attr("descricao").strip, :id => a.attr("id").strip)
	o.save
	puts "Criado Orgao #{o.sigla}, #{o.descricao}"

end

@doc = Nokogiri::XML(open "http://www.camara.gov.br/SitCamaraWS/Deputados.asmx/ObterDeputados")
@doc.xpath("//deputado").each do |d| 
	dep = Parlamentar.new(
		:idCadastro =>  d.xpath("idCadastro").text.strip,
		:matricula =>  d.xpath("matricula").text.strip,
		:idParlamentar =>  d.xpath("idParlamentar").text.strip,
		:nome =>  d.xpath("nome").text.strip,
		:nomeParlamentar =>  d.xpath("nomeParlamentar").text.strip,
		:sexo =>  d.xpath("sexo").text.strip,
		:uf =>  d.xpath("uf").text.strip,
		:partido =>  d.xpath("partido").text.strip,
		:gabinete =>  d.xpath("gabinete").text.strip,
		:anexo =>  d.xpath("anexo").text.strip,
		:fone =>  d.xpath("fone").text.strip,
		:email =>  d.xpath("email").text.strip
		)

	dep.save
	puts "Criado Deputado #{dep.nome} do #{dep.partido}"

	d.xpath("comissoes/titular/comissao").each {|comissao|
		dep.memberships << Membership.create(:tipo => 'titular', :orgao => Orgao.where(:sigla => comissao.attr("sigla").strip).first)

	}
	d.xpath("comissoes/suplente/comissoes").each { |comissao|
		dep.memberships << Membership.create(:tipo => 'suplente', :orgao => Orgao.where(:sigla => comissao.attr("sigla").strip).first)	}

	# dep.memberships.each {|m| puts "Adicionado #{dep.nome} a #{m.orgao.sigla} como #{m.tipo}" } if dep.memberships.nil?
	dep.save

end
