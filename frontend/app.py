import streamlit as st
import requests
from PIL import Image
import io

# Configurazione della pagina
st.set_page_config(page_title="Notizie Finanza", layout="wide", initial_sidebar_state="expanded")

# Stile dark e moderno
st.markdown("""
    <style>
        body {
            background-color: #0e1117;
            color: white;
        }
        .stApp {
            background-color: #0e1117;
        }
        .stButton > button {
            width: 100%;
            background-color: #1f1f2e;
            color: white;
            border: none;
            border-radius: 0.5rem;
            padding: 0.5rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }
        .stButton > button:hover {
            background-color: #3a3a4f;
            color: white;
        }
        .sidebar .sidebar-content {
            background-color: #0e1117;
        }
        .css-1aumxhk {
            background-color: #0e1117;
        }
    </style>
""", unsafe_allow_html=True)

# Sidebar moderna
with st.sidebar:
    st.markdown("## 📊 Pannello Notizie")
    st.markdown("---")

    selected = st.session_state.get("selected", "Crea Notizia")

    if st.button("📰 Crea Notizia"):
        selected = "Crea Notizia"
    if st.button("🤖 AI Generator"):
        selected = "AI Generator"
    if st.button("🔍 Ricerca Notizie"):
        selected = "Ricerca Notizie"
    if st.button("📚 Tutte le Notizie"):
        selected = "Tutte le Notizie"

    st.session_state["selected"] = selected

# Base URL del backend
BASE_URL = "http://localhost:8080"

# 📰 CREAZIONE NOTIZIA CON IMMAGINE
if selected == "Crea Notizia":
    st.title("📰 Crea una nuova notizia")
    titolo = st.text_input("Titolo")
    contenuto = st.text_area("Contenuto")
    tag = st.text_input("Tag (separati da virgola)")
    immagine = st.file_uploader("Carica un'immagine", type=["png", "jpg", "jpeg"])

    if st.button("Pubblica"):
        files = {"immagine": immagine.getvalue()} if immagine else {}
        data = {"titolo": titolo, "contenuto": contenuto, "tag": tag}

        try:
            response = requests.post(f"{BASE_URL}/notizie/crea-con-immagine", data=data, files=files)
            if response.status_code == 200:
                st.success("✅ Notizia pubblicata con successo!")
            else:
                st.error(f"Errore {response.status_code}: {response.text}")
        except Exception as e:
            st.error(f"Errore nella richiesta: {e}")

# 🤖 AI GENERATION
elif selected == "AI Generator":
    st.title("🤖 Generazione con AI (OpenAI)")

    testo_input = st.text_area("Inserisci il testo (parziale o completo)")

    col1, col2, col3 = st.columns(3)
    with col1:
        if st.button("✏️ Genera Titolo"):
            r = requests.post(f"{BASE_URL}/ai/genera-titolo", json={"testo": testo_input})
            st.success(r.text)
    with col2:
        if st.button("📄 Genera Riassunto"):
            r = requests.post(f"{BASE_URL}/ai/genera-riassunto", json={"testo": testo_input})
            st.success(r.text)
    with col3:
        if st.button("🏷️ Genera Tag"):
            r = requests.post(f"{BASE_URL}/ai/genera-tag", json={"testo": testo_input})
            st.success(r.text)

# 🔍 RICERCA AVANZATA
elif selected == "Ricerca Notizie":
    st.title("🔍 Ricerca Notizie Avanzata")

    titolo = st.text_input("Cerca per titolo")
    contenuto = st.text_input("Cerca nel contenuto")
    tag = st.text_input("Tag (es: finanza, economia)")
    anno = st.text_input("Anno di pubblicazione (es: 2025)")

    if st.button("🔎 Cerca"):
        params = {}
        if titolo: params["titolo"] = titolo
        if contenuto: params["contenuto"] = contenuto
        if tag: params["tag"] = tag
        if anno: params["anno"] = anno

        response = requests.get(f"{BASE_URL}/notizie/cerca", params=params)
        if response.status_code == 200:
            risultati = response.json()
            for notizia in risultati:
                st.subheader(notizia["titolo"])
                st.write(notizia["contenuto"])
                st.caption(f"Tag: {notizia['tag']} | Data: {notizia['dataPubblicazione']}")
                if notizia["urlImmagine"]:
                    st.image(notizia["urlImmagine"], width=400)
                st.markdown("---")
        else:
            st.error("Errore nella ricerca")

# 📚 TUTTE LE NOTIZIE
elif selected == "Tutte le Notizie":
    st.title("📚 Elenco Completo Notizie")

    try:
        response = requests.get(f"{BASE_URL}/notizie/tutte")
        if response.status_code == 200:
            notizie = response.json()
            for notizia in notizie:
                st.subheader(notizia["titolo"])
                st.write(notizia["contenuto"])
                st.caption(f"Tag: {notizia['tag']} | Data: {notizia['dataPubblicazione']}")
                if notizia["urlImmagine"]:
                    st.image(notizia["urlImmagine"], width=400)
                st.markdown("---")
        else:
            st.error("Errore nel recupero notizie")
    except Exception as e:
        st.error(f"Errore: {e}")
