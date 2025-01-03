<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
String nomeUser = (String) session.getAttribute("nome");
    if("admin".equals(nomeUser)){
    }else{
        response.sendRedirect("../Home.jsp");
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
            <div class="buttonView active"><button style="cursor: pointer;" ><i class="fa-solid fa-circle-plus" p onclick="window.location.href='cadNewFilme.jsp'"></i></button><p>Adicionar Filme</p></div>
            <div class="buttonView"><button style="cursor: pointer;" ><i class="fa-solid fa-user-plus" onclick="window.location.href='CadNewAtor.jsp'"></i></button><p>Adicionar Ator</p></div>
            <div class="buttonView"><button style="cursor: pointer;" ><i class="fa-solid fa-right-from-bracket" onclick="window.location.href='../logout.jsp'"></i></button><p>Logout</p></div>
        </div>
    </nav>
    <main class="main_page">
        <div class="">
            <!-- MENU DE FILTROS DO FILME -->
            <div class="cockpit_filmes_form ">
                <div class="cockpit_item_adm ">
                    <button class="btn_return" style="cursor: pointer;" onclick="window.location.href='./HomeAdmin.jsp'" ><i class="fa-solid fa-arrow-left"></i></button>
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
                            <label class="input_capas"> <input type="text" class=" principal"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Categoria</label>
                            <label class="input_capas"> <input list="cat" class=" principal">
                                <datalist id="cat">
                                    <option value="Edge">
                                    <option value="Firefox">
                                    <option value="Chrome">
                                    <option value="Opera">
                                    <option value="Safari">
                                </datalist></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Ano de Lançamento</label>
                            <label class="input_capas"> <input type="date" class=" principal"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Avaliações</label>
                            <label class="input_capas"> <input type="text" class=" principal"></label>
                        </div>
                        <div class="input_div_grid">
                            <label>Restrição de idade</label>
                            <label class="input_capas"> <input list="rest" class=" principal">
                                <datalist id="rest">
                                    <option value="+12">
                                    <option value="+14">
                                    <option value="+16">
                                    <option value="+18">
                                    <option value="Livre">
                                </datalist></label>
                        </div>
                    </div>
                    <div class="div_list_inputs ">
                        <div class="input_div_grid desc_area">
                            <label>Descrição</label>
                            <label class="input_capas"> <textarea class="descr_input"></textarea></label>
                        </div>
                    </div>
                    <div class="div_list_inputs colunm">
                        <div class="input_div_grid desc_area">
                            <label>Atores Principais</label>
                            <label class="input_capas"> <button onclick="openCloseModal('.modal_edit_user_info',1)">Adicionar Ator</button>                            </label>
                            <div class="container_actores_list ">
                                <div class="container_inputs_edit_actor">
                                    <div class="div_picture_actor_input">
                                        <label class="input_capas_picture"><input type="file" class="actor_picture"></label>
                                    </div>
                                    <div class="div_input_infos_actor">
                                        <div class="input_div_grid">
                                            <label>Avaliações</label>
                                            <label class="input_capas"> <input type="text" class=" principal"></label>
                                        </div>
                                        <div class="input_div_grid">
                                            <label>Avaliações</label>
                                            <label class="input_capas"> <input type="text" class=" principal"></label>
                                        </div>
                                        <div class="input_div_grid">
                                            <label>Avaliações</label>
                                            <label class="input_capas"> <input type="text" class=" principal"></label>
                                        </div>
                                    </div>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            
        </div>
        
       
    </main>
    <footer class="">
        <div class="footer_container_area ">
            
            <button class="delet_btn">
                
                Excluir
            </button>
      
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
      
        
    </footer>
    <div class="modal modal_edit_user_info hidden">
        <div class="modal_header">
            <p>Editar usuário</p>
            <button class="close" data-modal-close>X</button>
        </div>
        <div class="modal_content">
            <form class="flex">  
                <div class="avatar flex-center">
                    <div class="avatar_img flex-center">
                        <img src="" alt="Avatar">
                    </div>
                    <label class="avatar_input">
                        <input type="file" class="input_style">
                    </label>
                </div>
                <label class="new_name_label">
                    <span>Novo nome:</span>
                    <input type="text" name="" id="" class="input_style">
                </label>
                <input type="submit" value="Atualizar" class="input_style update_button">
            </form>
        </div>
    </div>
    <div id="modal_blur" class="hidden"></div>
    
    
    <script src="../scriptGlobal.js"></script>
    <script src="https://kit.fontawesome.com/3d5034d18d.js" crossorigin="anonymous"></script>
</body>
</html>