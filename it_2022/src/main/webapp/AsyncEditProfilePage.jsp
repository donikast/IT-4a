<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="models.User" %>
<%@ page import="models.Skill" %>

<!DOCTYPE html>
<html>
<jsp:include page="shared/head.jsp"/>

<body>

	<% User user = (User) session.getAttribute("loggedUser"); %>
<jsp:include page="shared/header.jsp"/>

	<div class="content">
	
		<input type="hidden" name="id" value="<%= user.getId() %>">
		<div>
			<div class="profile-image-container">
				<img src="images/male.svg" />
			</div>
			
			<form class="user-info">
			<div class="profile-info-container">
				<input type="hidden" name="id" value="<%= user.getId() %>">
				<h2>Профилна информация</h2>
				<p>Име:</p>
				<input type="text" name="personalName" value="<%= user.getPersonalName() %>" />
				<p>Професия:</p>
				<input type="text" name="jobTitle" value="<%= user.getJobTitle() %>" />
				<p>Описание:</p>
				<input type="text" name="description" value="<%= user.getDescription() %>" />
				<input type="button" onclick="updateUserInfo()" value="Редактирай" />
				<span id="result"></span>
			</div>
			</form>
		</div>
		<h2>Умения</h2>

		<div class="skills-container">
			<div class="skills-container-element">
				
		<% int i=0;
		for(Skill skill:user.getProfessionalSkills()) { %>
				<div>
				<input type="text" name="prof-skill-name<%=i%>" value="<%= skill.getSkillName() %>" />
				<input type="range" name="prof-skill-value<%=i%>" value="<%= skill.getSkillValue()%>" 
				min="0" max="100" step="10" />
				</div>

				<% i++;				
		} %>

			</div>

			<div class="skills-container-element">
					<% int j=0;
					for(Skill skill:user.getPersonalSkills()) { %>
				<div>
					<input type="text" name="personal-skill-name<%=j%>" value="<%= skill.getSkillName() %>" />
					<input type="range" name="personal-skill-value<%=j%>" value="<%= skill.getSkillValue()%>" 
					min="0" max="100" step="10" />
				</div>

				<% j++;
				} %>
			</div>
		</div>
		<h2>Контакти</h2>

		<div class="skills-container">
			<div class="skills-container-element">
				<div>
					<label>E-mail</label>
					<input type="text" name="email" value="<%= user.getEmail() %>" />
			</div>

				<div>
					<label>Град</label>
					<input type="text" name="city" value="<%= user.getAddress().getCity() %>" />
				</div>

			</div>

			<div class="skills-container-element">
				<div>
					<label>Телефон</label>
					<input type="text" name="phone" value="<%= user.getPhone() %>" />					 
				</div>

				<div>
					<label>Улица</label>
					<input type="text" name="street" value="<%= user.getAddress().getStreet() %>" />					 
				</div>			
			</div>
		</div>
	
	</div>
<jsp:include page="shared/footer.jsp"/>

</body>
</html>

