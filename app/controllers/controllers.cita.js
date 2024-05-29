import { pool } from "../config/db.mysql.js";

export const mostrarCita = async (req,res)=>{
    let id = req.params['id'];

    try {
        const respuesta = await pool.query(`CALL sp_MostrarCita(${id});`);
        res.json({"res":respuesta});
    } catch (err) {
        res.json({"error":err});
        
    }
}

export const listarCita = async(req,res)=>{

    try {
        const respuesta = await pool.query(`CALL sp_ListarCita`);
        res.json({"res":respuesta});
    } catch (err) {
        res.json({"error":err});
        
    }
}

export const crearCita = async(req,res)=>{
    const nombre = req.body.nombre;

    try {
        const respuesta = await pool.query(`CALL sp_CrearCita('${nombre}');`);

        if(respuesta[0].affectedRows == 1){
            res.json({"res":"Cita creada"});
        }else{
            res.json({"error":"No se creo la cita"});
        }
        
    } catch (err) {
        res.json({"error":err});
        
    }
}

export const modificarCita = async(req,res)=>{
    let id = req.body.id;
    let nombre = req.body.nombre;

    try {
        const respuesta = await pool.query(`CALL sp_ModificarCita(${id},'${nombre}');`);

        if(respuesta[0].affectedRows == 1){
            res.json({"res":"Cita modificada"});
        }else{
            res.json({"error":"No se modifico la cita"});
        }
        
    } catch (err) {
        res.json({"error":err});
        
    }
}

export const eliminarCita = async(req,res)=>{
    let id = req.body.id;

    try {
        const respuesta = await pool.query(`CALL sp_EliminarCita(${id});`);

        if(respuesta[0].affectedRows == 1){
            res.json({"res":"Cita eliminada"});
        }else{
            res.json({"error":"No se elimino la cita"});
        }
        
    } catch (err) {
        res.json({"error":err});
        
    }
}

