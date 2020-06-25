package com.codflix.backend.features.episode;

import com.codflix.backend.core.Template;
import com.codflix.backend.models.Episode;
import spark.Request;
import spark.Response;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static java.lang.Integer.parseInt;

public class EpisodeController {

    private final EpisodeDao episodeDao = new EpisodeDao();

    public String listEpisodes(Request request, Response response) {
        List<Episode> episodes;

        int id = Integer.parseInt(request.params(":id"));

        episodes = episodeDao.getEpisodeByMediaId(id);

        Map<String, Object> model = new HashMap<>();
        model.put("episodes", episodes);
        return Template.render("episodes_list.html", model);
    }
}
