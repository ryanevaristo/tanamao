class Profissional {
  int id;
  String nomeProfissional;
  String fotoProfissional;
  Profissao profissao = Profissao();
  String cnpjProfissional;
  String emailProfissional;
  String contato;
  String qualificacoes;
  String atuacao;
  String cidades;

  Profissional(
      {this.id,
      this.nomeProfissional,
      this.fotoProfissional,
      this.profissao,
      this.cnpjProfissional,
      this.emailProfissional,
      this.contato,
      this.qualificacoes,
      this.atuacao,
      this.cidades});

  Profissional.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeProfissional = json['nome_profissional'];
    fotoProfissional = json['foto_profissional'];

    profissao = json['profissao'] != null
        ? new Profissao.fromJson(json['profissao'])
        : null;
    cnpjProfissional = json['cnpj_profissional'];
    emailProfissional = json['email_profissional'];
    contato = json['contato'];
    qualificacoes = json['qualificacoes'];
    atuacao = json['atuacao'];
    cidades = json['cidades'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_profissional'] = this.nomeProfissional;
    data['foto_profissional'] = this.fotoProfissional;
    if (this.profissao != null) {
      data['profissao'] = this.profissao.toJson();
    }
    data['cnpj_profissional'] = this.cnpjProfissional;
    data['email_profissional'] = this.emailProfissional;
    data['contato'] = this.contato;
    data['qualificacoes'] = this.qualificacoes;
    data['atuacao'] = this.atuacao;
    data['cidades'] = this.cidades;
    return data;
  }
}

class Profissao {
  int id;
  String nomeProfissao;

  Profissao({this.id, this.nomeProfissao});

  Profissao.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeProfissao = json['nome_profissao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_profissao'] = this.nomeProfissao;
    return data;
  }
}

class Vaga {
  int id;
  String nomeVaga;
  String tipoEmprego;
  String descricao;
  String requisito;
  String formacao;
  String nivelExperiencia;
  String beneficio;

  Vaga(
      {this.id,
      this.nomeVaga,
      this.tipoEmprego,
      this.descricao,
      this.requisito,
      this.formacao,
      this.nivelExperiencia,
      this.beneficio});

  Vaga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeVaga = json['nome_vaga'];
    tipoEmprego = json['tipo_emprego'];
    descricao = json['descricao'];
    requisito = json['Requisito'];
    formacao = json['formacao'];
    nivelExperiencia = json['nivel_experiencia'];
    beneficio = json['beneficio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_vaga'] = this.nomeVaga;
    data['tipo_emprego'] = this.tipoEmprego;
    data['descricao'] = this.descricao;
    data['Requisito'] = this.requisito;
    data['formacao'] = this.formacao;
    data['nivel_experiencia'] = this.nivelExperiencia;
    data['beneficio'] = this.beneficio;
    return data;
  }
}

class Secretaria {
  int id;
  String nomeSecretaria;
  String endereco;
  String informacoes;
  String contato;

  Secretaria(
      {this.id,
      this.nomeSecretaria,
      this.endereco,
      this.informacoes,
      this.contato});

  Secretaria.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeSecretaria = json['nome_secretaria'];
    endereco = json['endereco'];
    informacoes = json['informacoes'];
    contato = json['contato'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome_secretaria'] = this.nomeSecretaria;
    data['endereco'] = this.endereco;
    data['informacoes'] = this.informacoes;
    data['contato'] = this.contato;
    return data;
  }
}
