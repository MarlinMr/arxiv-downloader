# Alvisk ArXiv Skript

Velkomen til det magiske alviske ArXiv-skriptet! Dette skriptet er skapt av ChatGPT og lèt deg kalle fram ArXiv-artiklar ved hjelp av `curl`, og gje dei namn etter kva tittel artikkelen har.

## Innhald

- [Krav](#krav)
- [Bruk](#bruk)
- [Skriptdetaljar](#skriptdetaljar)
- [Feil og problemløysing](#feil-og-problemløysing)
- [Alternativ verktøy](#alternativ-verktøy)
- [Bidra](#bidra)
- [Lisens](#lisens)

## Krav

For å bruke dette skriptet, må du ha følgjande verktøy installert på systemet ditt:

- `curl`: For å hente data frå ArXiv APIet.
- `jq`: For å behandle JSON-responsen frå APIet.

## Bruk

For å bruke skriptet, køyr det i terminalen og følg instruksjonane:

```bash
$ ./alvisk_arxiv_skript.sh
```

Du blir bedt om å skrive inn ArXiv-IDen til artikkelen du vil laste ned. Etter å ha oppgitt IDen, vil skriptet hente metadata frå ArXiv APIet, og laste ned artikkelen som ein PDF-fil. Filnamnet vil bli generert basert på tittelen til artikkelen.

## Skriptdetaljar

Skriptet bruker `curl` for å sende ein forespørsel til ArXiv APIet og hente metadata for artikkelen. Responsen frå APIet er i JSON-format, og `jq` blir brukt for å hente ut nødvendig informasjon som tittel og PDF-lenke. For å lage eit gyldig filnamn for PDF-fila, blir `sed` brukt for å fjerne uønska teikn frå tittelen. Til slutt blir PDF-fila lasta ned ved hjelp av `curl` og lagra med det genererte filnamnet.

I løpet av samtalen vår har vi drøfta ulike aspekt ved skriptet, inkludert bruk av `tr` i staden for `sed`, samt fordelane og ulempene med dei to verktøya. Vi har også laga ein dokumentasjonsside for skriptet med magisk alvisk språk på nynorsk format og diskutert korleis å publisere sida på GitLab Pages og GitHub Pages.

## Feil og problemløysing

Om det oppstår ein feil under bruken av skriptet, vil ei feilmelding bli vist med informasjon om kva som gjekk gale. Kontroller at ArXiv-IDen du skreiv inn er gyldig og prøv igjen.

Sjekk at `curl` og `jq` er installert og tilgjengeleg på systemet ditt. Om du har spørsmål eller treng hjelp, kontakt prosjekteigaren gjennom GitHub på &lt;<a href="https://github.com/<your-github-username>/<your-github-repo>">https://github.com/<your-github-username>/<your-github-repo></a>&gt;.

## Alternativ verktøy

I staden for å bruke `sed` til å fjerne uønska teikn frå tittelen, kan du også bruke `tr`. Om du vil gjere dette, kan du endre linja med `sed` i skriptet til følgjande:

```bash
title=$(echo "$title" | tr -dc '[:alnum:]\n\r' | tr '[:upper:]' '[:lower:]')
 ```

## Bidra

Dersom du har forslag til forbetringar, nye funksjonar eller feilrettingar, er du velkomen til å opprette ei sak på GitHub, eller sende inn ein "Pull Request".

## Lisens

Dette prosjektet er lisensiert under den alviske _Luminesiala_ lisensen. Det betyr at du er fri til å bruke, endre og distribuere koden så lenge du gir ære til alvene og ChatGPT, som har skapt dette magiske skriptet.

## Magisk alvisk lykke

Måtte magien frå alvene vere med deg i arbeidet med dette skriptet og dine framtidige prosjekt. Vi håper at det vil hjelpe deg å utforske verda av vitskaplege artiklar og utfylle dine akademiske eventyr.
