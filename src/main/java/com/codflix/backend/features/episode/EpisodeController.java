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
        List<Integer> allSeasons;

        int media = Integer.parseInt(request.params(":media"));

        int season = Integer.parseInt(request.params(":season"));

        allSeasons = episodeDao.getSeasons(media);

        episodes = episodeDao.getEpisodeBySeason(season);

        // Créer une liste de contenu unique basée sur les éléments de ArrayList
        Set<Integer> seasons = new HashSet<>(allSeasons);

        // Créer une Nouvelle ArrayList à partir de Set
        List<Integer> seasonsFinal = new ArrayList<>(seasons);


        HashMap<Object, Object> episodesBySeason = new HashMap<>();
        episodesBySeason.put(seasonsFinal, episodes);

        System.out.println(episodesBySeason);

        Map<String, Object> model = new HashMap<>();
        model.put("seasons", episodesBySeason);
        return Template.render("episodes_list.html", model);
    }
}
