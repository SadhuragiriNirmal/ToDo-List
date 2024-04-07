<%@page import="dto.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo</title>
<link rel="stylesheet" href="index.css">
</head>
<body>

   <body>

    <header id="navbar">
        <nav>
            <a id="nac1" class="nitem1" href="#home">Home</a>
            <a id="nac2" class="nitem1" href="#testimonial">Testimonial</a>
            <a id="nac3" class="nitem1" href="#about">About</a>
            <% 
              
               HttpSession ses = request.getSession();
               User u = (User) ses.getAttribute("user");
               if(u != null) {
            %>
            <a id="nac3" class="nitem1" href="back">Tasks</a>
            <%} %>
        </nav>
        <section>
            <a id="nac4" class="nitem2" href="signup.jsp">SignUp</a>
            <a id="nac5" class="nitem2" href="login.jsp">Login</a>
        </section>
    </header>

    <!-- home -->

    <div id="home">
      <section id="gridhs">
        <img src="assert/todo-list-wizard.png" alt="">
        
        <div>
            <h1 id="show">To do list</h1>
            <div id="bar"></div>
            <p>
                Create to do lists for weddings, parades, Halloween parties, nursery festivals, camps, Travel and for many more events and share this to do list with your friends. It's free and can be used without registration
            </p>
        </div>

        <img src="assert/kanban.png" alt="">
        
      </section>

    </div>

    <!-- testimonial -->

    <div id="testimonial">
        <section>
            <div id="t1">
                <h1>Effortlessly Organize Your Day</h1>
                <div class="bar"></div>
                <p>
                    "I've struggled with staying on top of my tasks for years, but ever since I started using this todo list app, everything changed. The interface is clean and intuitive, making it a breeze to add, organize, and prioritize tasks. Now, I'm more productive than ever, and I never miss a deadline. Highly recommended!"
                </p>
            </div>
            <div id="t2">
                <h1>A Game-Changer for Productivity</h1>
                <div class="bar"></div>
                <p>
                    "This app has completely transformed the way I manage my daily tasks. With its sleek design and user-friendly features, I can easily track my progress and stay focused throughout the day. Plus, the ability to set reminders ensures that nothing slips through the cracks. Thanks to this app, I'm more organized and productive than I've ever been."
                </p>
            </div>
            <div id="t3">
                <h1>Simplify Your Life with This App</h1>
                <div class="bar"></div>
                <p>
                    "Gone are the days of sticky notes and forgotten tasks. Thanks to this todo list app, I finally have a centralized place to manage all my responsibilities. Whether it's work-related projects or personal errands, this app helps me stay on track and accomplish my goals. It's like having a personal assistant in my pocket, and I couldn't imagine my life without it."
                </p>
            </div>
        </section>
    </div>

    <!--Multi-->

    <section id="multi">

    <section>
        <div>
            <h1 id="show">Plan and share checklists online</h1>
            <div id="bar"></div>
            <p>
                create checklists and share them with your friends. with your friends. Together you can complete projects quickly and efficiently. This makes collaboration fun and the project a success.
            </p>
        </div>

        <img src="assert/checklist-and-share.png" alt="">
    </section>  

    </section>
    <div id="fine">
        <div id="compen">

            <img src="assert/comments.png" alt="">


        </div>  
    </div> 

    <!-- about -->
    <div id="about">
        <section>
           <div id="a1">
                <h2>LEARNING</h2>
                <div class="bar"></div>
                <p>
                    Create a To Do List
                    <br>
                    Plan and share tasks
                    <br>
                    Create Kanban Board
                    <br>
                    Project management
                    <br>
                    File Upload
                    <br>
                    Write comments
                </p>
           </div>
           <div id="a2">
            <h2>LINKS</h2>
             <div class="bar"></div>
             <p>
                Imprint
                <br>
                Privacy
                <br>
                Terms of use
             </p>

           </div>
           <div id="a3">
            <h1>This makes collaboration fun and the project a success.</h1>
            <div class="bar"></div>
            <h3>Powered By MSG Keni Tech</h3>
           </div>

        </section>
    </div>
    
    <script src="index.js"></script>
       

</body>
</html>