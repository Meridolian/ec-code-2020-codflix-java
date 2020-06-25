package com.codflix.backend.features.contact;

import com.codflix.backend.core.Template;
import spark.Request;
import spark.Response;
import spark.Session;

import java.util.HashMap;
import java.util.Map;

public class ContactController {

    public String getContact(Request request, Response response) {
        boolean logged;

        // If there is an active session, changes the view html view
        Session session = request.session(false);
        if (session != null) {
            logged = true;
        }
        else {
            logged = false;
        }

        Map<String, Object> model = new HashMap<>();
        model.put("logged", logged);
        return Template.render("contact.html", model);
    }

    public String sendEmail(Request request, Response response){
        return "ok";
    }
}
