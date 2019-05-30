# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 0) do

  create_table "billetera", primary_key: "id_transaccion", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.decimal "entrada_transaccion", precision: 7, scale: 2, null: false
    t.decimal "salida_transaccion", precision: 7, scale: 2, null: false
    t.decimal "saldo_transaccion", precision: 7, scale: 2, null: false
    t.datetime "fecha_hora_transaccion", null: false
    t.integer "id_cliente", null: false
    t.index ["id_cliente"], name: "id_cliente"
  end

  create_table "categorias", primary_key: "id_categoria", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "nombre_categoria", null: false
    t.string "descripcion_categoria", null: false
  end

  create_table "clientes", primary_key: "id_cliente", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "user_cliente", null: false
    t.string "pass_cliente", null: false
    t.decimal "saldo_cliente", precision: 7, scale: 2, null: false
    t.string "nombres_cliente", null: false
    t.string "apellidos_cliente", null: false
    t.string "telefono_cliente", null: false
    t.string "correo_cliente", null: false
    t.string "ubicacion_cliente", limit: 15, null: false
  end

  create_table "controlador", primary_key: "id_controlador", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "descripcion_controlador", null: false
  end

  create_table "detalle_factura", primary_key: "id_detalle", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.integer "cantidad_detalle", null: false
    t.string "descripcion_detalle", null: false
    t.decimal "precio_venta", precision: 7, scale: 2, null: false
    t.integer "id_factura", null: false
    t.integer "id_producto", null: false
    t.index ["id_factura"], name: "id_factura"
    t.index ["id_producto"], name: "id_producto"
  end

  create_table "enlaces", primary_key: "id_enlace", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "estado_enlace", limit: 10, null: false
    t.datetime "fecha_hora_enlace", null: false
    t.integer "id_seguro", null: false
    t.integer "id_sku", null: false
    t.index ["id_seguro"], name: "id_seguro"
    t.index ["id_sku"], name: "id_sku"
  end

  create_table "factura", primary_key: "id_factura", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.integer "serie_factura", null: false
    t.integer "numero_factura", null: false
    t.datetime "fecha_hora_factura", null: false
    t.decimal "subtotal_factura", precision: 7, scale: 2, null: false
    t.decimal "igv_factura", precision: 7, scale: 2, null: false
    t.decimal "total_factura", precision: 7, scale: 2, null: false
    t.integer "id_cliente", null: false
    t.index ["id_cliente"], name: "id_cliente"
  end

  create_table "lotes", primary_key: "id_lote", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.integer "stock_lote", null: false
    t.integer "id_producto", null: false
    t.index ["id_producto"], name: "id_producto"
  end

  create_table "productos", primary_key: "id_producto", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "nombre_producto", null: false
    t.string "descripcion_producto", null: false
    t.integer "id_categoria", null: false
    t.index ["id_categoria"], name: "id_categoria"
  end

  create_table "seguros", primary_key: "id_seguro", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "estado_seguro", limit: 9, null: false
    t.integer "id_controlador", null: false
    t.index ["id_controlador"], name: "id_controlador"
  end

  create_table "skus", primary_key: "id_sku", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "codigo_qr_sku", null: false
    t.decimal "precio_venta_sku", precision: 10, null: false
    t.string "estado_sku", limit: 10, null: false
    t.integer "id_detalle"
    t.integer "id_lote", null: false
    t.index ["id_detalle"], name: "id_detalle"
    t.index ["id_lote"], name: "id_lote"
  end

  create_table "tokens", primary_key: "id_token", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.string "imagen", null: false
    t.string "md5", null: false
  end

  create_table "visitas", primary_key: "id_visita", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci", force: :cascade do |t|
    t.datetime "tipo_visita", null: false
    t.datetime "fecha_hora_visita", null: false
    t.integer "id_cliente", null: false
    t.integer "id_token", null: false
    t.index ["id_cliente"], name: "id_cliente"
    t.index ["id_token"], name: "id_token"
  end

  add_foreign_key "detalle_factura", "factura", column: "id_factura", primary_key: "id_factura", name: "fk_factura_detalle", on_update: :cascade, on_delete: :cascade
  add_foreign_key "detalle_factura", "productos", column: "id_producto", primary_key: "id_producto", name: "fk_producto_detalle", on_update: :cascade, on_delete: :cascade
  add_foreign_key "enlaces", "seguros", column: "id_seguro", primary_key: "id_seguro", name: "fk_seguro_enlace", on_update: :cascade, on_delete: :cascade
  add_foreign_key "enlaces", "skus", column: "id_sku", primary_key: "id_sku", name: "fk_sku_enlace", on_update: :cascade, on_delete: :cascade
  add_foreign_key "factura", "clientes", column: "id_cliente", primary_key: "id_cliente", name: "fk_cliente_factura", on_update: :cascade, on_delete: :cascade
  add_foreign_key "lotes", "productos", column: "id_producto", primary_key: "id_producto", name: "fk_producto_lote", on_update: :cascade, on_delete: :cascade
  add_foreign_key "productos", "categorias", column: "id_categoria", primary_key: "id_categoria", name: "fk_categoria_producto", on_update: :cascade, on_delete: :cascade
  add_foreign_key "seguros", "controlador", column: "id_controlador", primary_key: "id_controlador", name: "fk_controlador_seguro", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skus", "detalle_factura", column: "id_detalle", primary_key: "id_detalle", name: "fk_detalle_sku", on_update: :cascade, on_delete: :cascade
  add_foreign_key "skus", "lotes", column: "id_lote", primary_key: "id_lote", name: "fk_lote_sku", on_update: :cascade, on_delete: :cascade
  add_foreign_key "visitas", "clientes", column: "id_cliente", primary_key: "id_cliente", name: "fk_cliente_visita", on_update: :cascade, on_delete: :cascade
  add_foreign_key "visitas", "tokens", column: "id_token", primary_key: "id_token", name: "fk_token_visita", on_update: :cascade, on_delete: :cascade
end
