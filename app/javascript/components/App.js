import React, { useState, useEffect } from "react";
import "./App.css";
import Search from "./Search";


function App() {
  const [searching, setSearching] = useState(false);
  const [term, setTerm] = useState("");
  const [searches, setSearches] = useState({ data: [] });

  useEffect(() => {    
    async function fetchSearches() {
      getAllSearch()
    }
    fetchSearches();
  }, []);

  const getAllSearch =  async (event) => {
    let response = await fetch(`/api/jobs/searches`);
    let searches = await response.json();
    setSearches(searches);
    console.log(searches);
  }


  const search = async (event) => {
    event.preventDefault();
    if (term.length < 3) return;
    setSearching(true);
    let response = await fetch(
      `/api/jobs/searches?query=${encodeURIComponent(term)}`,
      { method: "POST" }
    );
    // let search = await response.json();
    setSearching(false);

    getAllSearch()
    // setSearches({ data: [search.data, ...searches.data] });

  };

  const clearSearch = async (event) => {
    event.preventDefault();
    alert("Not implemented.");
  };

  const markAsFavorite = (jobId) => async (event) => {
    event.preventDefault();

    let response = await fetch(
      `/api/jobs/favorites/${encodeURIComponent(jobId)}`,  
      { method: "PUT" });

      let searches = await response;
            
      if(searches.ok){
        getAllSearch();
      }
  };

  const deleteSearch = (jobId) => async (event) => {
    event.preventDefault();

    let response = await fetch(
      `/api/jobs/searches/${encodeURIComponent(jobId)}`,  
      { method: "DELETE" });

      let searches = await response;
      
      if(searches.ok){
        getAllSearch();
      }
  };


  return (
    <div className="App">
      <Search props={term}/>

      <input
        id="term"
        type="text"
        value={term}
        onChange={({ target: { value } }) => setTerm(value)}
      />
                   
      <button type="button" onClick={search}>
        Search
      </button>      
      <button type="button" onClick={clearSearch}>
        Clear
      </button>


      {searching && <div style={{ marginTop: "5px" }}>...searching</div>}

      {searches.data.length > 0 ? (
        <div className="searches">
          {searches.data.map((search) => (

            <div key={search.id}>
              <h3>{search.attributes.query}              
                <button
                  type="button"
                  style={{ marginLeft: "5px" }}
                  onClick={deleteSearch(search.id)}
                > 
                  Delete
                </button>
              </h3>

              {search.attributes.jobs.data.length > 0 ? (
                <ol>
                  {search.attributes.jobs.data.map((job) => (
                                        
                    <li key={job.id}>                      
                      <a
                        href={job.attributes.link}
                        target="_blank"
                        className={job.attributes.favorite ? "favorite" : ""}
                      >{`${job.attributes.title} by ${job.attributes.company}`}</a>
                      
                      <button
                        type="button"
                        style={
                                { marginLeft: "5px", 
                                  backgroundColor: job.attributes.favorite ? 'green' : 'gray' }
                              }
                        onClick={markAsFavorite(job.id)}                        
                      >
                        Fav {job.id}
                      </button>
                    </li>
                  ))}
                </ol>
              ) : (
                <p>No jobs found...</p>
              )}
            </div>
          ))}
        </div>
      ) : (
        <p>No results</p>
      )}
    </div>
  );
}

export default App;
