# JUNO (JUpyter NOtebooks)

This project enables the deployment of Jupyter Notebook inside an [OSCAR](https://oscar.grycap.net/) cluster, allowing users to interact with OSCAR, through its [Python client](https://github.com/grycap/oscar_python).  

It also includes support for [Elyra](https://github.com/elyra-ai/elyra), for composing AI inference pipelines, and [APRICOTLab](https://github.com/grycap/apricotlab), to facilitate computational reproducibility by deploying virtualized infrastructures via the [Infrastructure Manager (IM])(https://www.grycap.upv.es/im).

## Forms of use

To use this functionality from an OSCAR cluster, you simply need to enter the Dashboard and then go to `Notebooks` → `Deploy`.

You also can use the `juno.yaml` and `script.sh`, presents in this repository and deploy it as an OSCAR service.

## Examples

If you go to the examples directory, you can find a simple tutorial that will teach you how to use OSCAR through Jupyter Notebooks with two basic use cases.

It will show you how to:
- Set up the notebook environment.
- Create and call a synchronous service. 
- Create and call an asynchronous service.
- Delete the created services.

## Resources and Documentation

- [OSCAR Documentation](https://docs.oscar.grycap.net/)  
- [OSCAR API](https://docs.oscar.grycap.net/api/)  
- [Functions Definition Language (FDL)](https://docs.oscar.grycap.net/fdl/)   
- OSCAR Python Client - [GitHub](https://github.com/grycap/oscar_python) / [PyPi](https://pypi.org/project/oscar-python/)    
- [APRICOTLab](https://github.com/grycap/apricotlab)   
- [Elyra](https://github.com/elyra-ai/elyra) 