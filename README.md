# JUNO 

This project is a module that enables the use of Jupyter Notebook inside the [OSCAR](https://oscar.grycap.net/) cluster, allowing users to interact with the cluster, through its [python client](https://github.com/grycap/oscar_python).  

It also includes support for [Elyra](https://github.com/elyra-ai/elyra) and [APRICOT](https://github.com/grycap/apricotlab) (Advanced Platform for Reproducible Infrastructure in the Cloud via Open Tools).

## Forms of use

To use this module from the OSCAR cluster, you simply need to enter the cluster web UI and then go to `Nootebooks` → `Deploy`.

You also can take the `juno.yaml` and `script.sh`, presents in this project and deploy it as an OSCAR service.

## Examples

If you go to the examples directory, you can find a simple tutorial that will teach you how to use OSCER through Jupyter Notebooks with two basic use cases.

It will show you how to:
- Set up the notebook environment.
- Create and call a synchronous service. 
- Create and call an asynchronous service.
- Delete the created services.

## Resources and Documentation

- [OSCAR Documentation](https://docs.oscar.grycap.net/)  
- [OSCAR OpenAPI](https://docs.oscar.grycap.net/api/)  
- [Functions Definition Language (FDL)](https://docs.oscar.grycap.net/fdl/)   
- OSCAR Python Client - [GitHub](https://github.com/grycap/oscar_python) / [PyPi](https://pypi.org/project/oscar-python/)    
- [APRICOT](https://github.com/grycap/apricotlab)   
- [Elyra](https://github.com/elyra-ai/elyra) 