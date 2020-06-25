package com.codflix.backend.features.episode;

import com.codflix.backend.core.Template;
import com.codflix.backend.models.Episode;
import spark.Request;
import spark.Response;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class EpisodeController {

    private final EpisodeDao episodeDao = new EpisodeDao();

    public String listEpisodes(Request request, Response response) {
        List<Episode> episodes;
        List<Integer> seasons;

        int media = Integer.parseInt(request.params(":media"));

        int season = Integer.parseInt(request.params(":season"));

        seasons = episodeDao.getSeasons(media);

        episodes = episodeDao.getEpisodeBySeason(season);

        HashMap<Object, Object> episodesBySeason = new HashMap<>();
        episodesBySeason.put(seasons, episodes);

        System.out.println(episodesBySeason);

        Map<String, Object> model = new HashMap<>();
        model.put("seasons", episodesBySeason);
        return Template.render("episodes_list.html", model);
    }
}
