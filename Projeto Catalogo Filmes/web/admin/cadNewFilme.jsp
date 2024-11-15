<%@page import="model.GeneroFilme"%>
<%@page import="model.Filme"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

    // Recebendo parâmetros
    String nome = request.getParameter("nome");
    String sinopse = request.getParameter("sinopse");
    String duracao = request.getParameter("duracao");
    String data = request.getParameter("data");
    String oper = request.getParameter("oper");  // Recebendo operação
    String classificacaoStr = request.getParameter("classificacao");
    int classificacao = 0;
    String avaliacaoStr = request.getParameter("avaliacao");
    double avaliacao = 0.0;
    String genreoStr = request.getParameter("categoria");
    int categoria;
    
    // Inicializando o objeto filme
    Filme film = new Filme();
        
    // Verificando se a operação é '1' (Adicionar filme)
    if ("1".equals(oper) && nome != null) {
        // Atribuindo valores ao objeto Filme
        film.nome = nome;
        film.sinopse = sinopse;
        film.duracao = duracao;
        film.dataLancamento = data;

        // Validando e atribuindo a avaliação
        if (avaliacaoStr != null && !avaliacaoStr.trim().isEmpty()) {
            try {
                avaliacao = Double.parseDouble(avaliacaoStr);
                film.avaliacao = avaliacao;
            } catch (NumberFormatException e) {
                // Tratar erro de conversão de número
                e.printStackTrace();  // Log de erro ou definir valor padrão
                film.avaliacao = 0.0;
            }
        }
        // Processando a classificação
        if (classificacaoStr != null && !classificacaoStr.trim().isEmpty()) {
            // Verificando a classificação para converter em um número
            if (classificacaoStr.equals("12") || classificacaoStr.equals("+12")) {
                classificacao = 12;
            } else if (classificacaoStr.equals("14") || classificacaoStr.equals("+14")) {
                classificacao = 14;
            } else if (classificacaoStr.equals("16") || classificacaoStr.equals("+16")) {
                classificacao = 16;
            } else if (classificacaoStr.equals("18") || classificacaoStr.equals("+18")) {
                classificacao = 18;
            } else if (classificacaoStr.equalsIgnoreCase("Livre")) {
                classificacao = 0; // Valor para classificação "Livre"
            } else {
                classificacao = 0; // V
                //valor padrão, caso o valor não corresponda
            }
            film.classificacao = classificacao;
        }
        film.incluirFilme();
        
        GeneroFilme genf = new GeneroFilme();
        
        if(genreoStr != null && !genreoStr.trim().isEmpty()){
             if (genreoStr.equals("Ação")) {
                genf.idGenero = 1;
            }else if(genreoStr.equals("Comédia")){
                genf.idGenero = 2;
            }else if(genreoStr.equals("Românce")){
                genf.idGenero = 3;
            }else if(genreoStr.equals("Aventura")){
                genf.idGenero = 4;
            }else if(genreoStr.equals("Ficção")){
                genf.idGenero = 5;
            }else if(genreoStr.equals("Desenho")){
                genf.idGenero = 6;
            } 
            
            genf.idFilme = genf.buscarUltimoFilme();
            
    }
        
    }
%>


<!DOCTYPE html>
<html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Feedback Cinema - Cliente</title>
        <link rel="stylesheet" href="../global.css">
        <link rel="stylesheet" href="../home.css">
        <link rel="stylesheet" href="styles/menu.css">
        <link rel="stylesheet" href="styles/generalHome.css">
        <link rel="stylesheet" href="styles/formsNewFilm.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
              integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@0,100,200,300,400,500,600,700,800,900;1,100,200,300,400,500,600,700,800,900&display=swap"
            rel="stylesheet">
    </head>

    <body class="body">
        <nav class="container-menu">
            <div class="buttonsAreaView">
                <div class="buttonView active"><button><i class="fa-solid fa-circle-plus"></i></button>
                    <p>Adicionar Filme</p>
                </div>
                <div class="buttonView"><button><i class="fa-solid fa-user-plus"></i></button>
                    <p>Adicionar Filme</p>
                </div>
                <div class="buttonView"><button><i class="fa-solid fa-right-from-bracket"></i></button>
                    <p>Adicionar Filme</p>
                </div>
            </div>
        </nav>

        <form method="get" action="cadNewFilme.jsp" name="formreg" onsubmit="formreg.oper.value = '1'">
            <input type="hidden" name="oper" value="0">  <!-- Campo oculto para 'oper' -->

            <main class="main_page">

                <div class="">  
                    <!-- MENU DE FILTROS DO FILME -->
                    <div class="cockpit_filmes_form ">

                        <div class="cockpit_item_adm ">
                            <button class="btn_return"><i class="fa-solid fa-arrow-left"></i></button>

                            <h1>Capas & Banners</h1>
                        </div>

                    </div>

                    <section id="filmes_container container_G_Fil " class="div_security_area ">
                        <div class="inputs_area ">
                            <div class="input_div">
                                <label>Capa principal</label>
                                <label class="input_capas"> <input type="file" class=" principal"></label>
                            </div>
                            <div class="input_div">
                                <label>Banner principal</label>
                                <label class="input_capas"> <input type="file" class=" banners"></label>
                            </div>
                        </div>
                        <div class="inputs_area linear ">
                            <h1> Informações</h1>
                            <div class="div_list_inputs">
                                <div class="input_div_grid">
                                    <label>Nome</label>
                                    <label class="input_capas"> <input type="text" class=" principal" name="nome" required></label>
                                </div>
                                <div class="input_div_grid">
                                    <label>Categoria</label>
                                    <label class="input_capas"> <input list="cat" class=" principal" name="categoria">
                                        <datalist id="cat"> 
                                            <option value="Românce">
                                            <option value="Ação">
                                            <option value="Aventura">
                                            <option value="Desenho">
                                            <option value="Ficção">
                                            <option value="Comédia">
                                        </datalist></label>
                                </div>
                                <div class="input_div_grid">
                                    <label>Ano de Lançamento</label>
                                    <label class="input_capas"> <input type="date" class=" principal" name="data"></label>
                                </div>
                                <div class="input_div_grid">
                                    <label>Duração em minutos</label>
                                    <label class="input_capas"> <input type="text" class=" principal" name="duracao"></label>
                                </div>
                                <div class="input_div_grid">
                                    <label>Avaliações</label>
                                    <label class="input_capas"> <input type="text" class=" principal" name="avaliacao"></label>
                                </div>
                                <div class="input_div_grid">
                                    <label>Restrição de idade</label>
                                    <label class="input_capas"> <input list="rest" class=" principal" name="classificacao">
                                        <datalist id="rest">
                                            <option value="+12" name="1">
                                            <option value="+14" name="2">
                                            <option value="+16" name="3">
                                            <option value="+18" name="4">
                                            <option value="Livre" name="0">
                                        </datalist></label>
                                </div>

                            </div>
                            <div class="div_list_inputs ">
                                <div class="input_div_grid desc_area">
                                    <label>Descrição</label>
                                    <label class="input_capas"> <textarea class="descr_input" name="sinopse"></textarea></label>
                                </div>

                            </div>
                            <div class="div_list_inputs colunm">
                                <div class="input_div_grid desc_area">
                                    <label>Atores Principais</label>
                                    <label class="input_capas"> <button>Adicionar Ator</button></label>
                                    <div class="container_actores_list ">
                                        <div class="actors_div_film">
                                            <!-- <img src="../imgs/foto34.png" alt=""> -->
                                            <div class="box_color_bg">
                                            </div>
                                            <div class="container_names_actors">

                                                <p class="title_persona_name location">Nome do Personagem</p>
                                                <p class="title_actor_name location">Nome do Ator</p>
                                            </div>


                                        </div>
                                        <div class="actors_div_film">
                                            <!-- <img src="../imgs/foto34.png" alt=""> -->
                                            <div class="box_color_bg">
                                            </div>
                                            <div class="container_names_actors">

                                                <p class="title_persona_name location">Nome do Personagem</p>
                                                <p class="title_actor_name location">Nome do Ator</p>
                                            </div>


                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </section>

                </div>
            </main>

            <div class="footer_container_area ">

                <!-- <button class="add_btn">
                    <i class="fa-solid fa-pen"></i>
                    Editar
                </button> -->

            </div>
            <div class="footer_container_area ">
                <button class="cancel_btn">
                    <!-- <i class="fa-solid fa-xmark"></i> -->
                    Cancelar
                </button>

                <button class="add_btn">
                    <i class="fa-solid fa-plus"></i>
                    Adicionar
                </button>
            </div>
        </form>

        <footer class="">

        </footer>

        <script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>

    </body>

</html>

